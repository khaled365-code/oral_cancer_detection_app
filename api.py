

from flask import Flask, request, jsonify
from flask_cors import CORS
import joblib

app = Flask(__name__)
CORS(app)
# Load your model using joblib
model = joblib.load('classifierRF.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    # Extract the input variables from the form data

    localization = [0, 0, 0,0,0 ]
    selected_localization = request.form.get('localization')
    for i in range(len(localization)):
        localization[i] = 1 if i == int(selected_localization) else 0


    tobacco_use = [0, 0, 0,0]
    selected_tobacco_use = request.form.get('tobacco_use')
    for i in range(len(tobacco_use)):
        tobacco_use[i] = 1 if i == int(selected_tobacco_use) else 0

    alcohol_consumption = [0, 0, 0,0]
    selected_alcohol_consumption = request.form.get('alcohol_consumption')
    for i in range(len(alcohol_consumption)):
        alcohol_consumption[i] = 1 if i == int(selected_alcohol_consumption) else 0

    sun_exposure = [0, 0, 0]
    selected_sun_exposure = request.form.get('sun_exposure')
    for i in range(len(sun_exposure)):
        sun_exposure[i] = 1 if i == int(selected_sun_exposure) else 0

    gender = [0, 0]
    selected_gender = request.form.get('gender')
    for i in range(len( gender)):
        gender[i] = 1 if i == int( selected_gender) else 0



    age_group= [0, 0,0]
    selected_age_group = request.form.get('age_group')
    for i in range(len(age_group)):
        age_group[i] = 1 if i == int( selected_age_group) else 0





    # print(localization)
    # localization = [request.form.get('localization_Tongue'), request.form.get('localization_Lip'), request.form.get('localization_Floor_of_mouth'),  request.form.get('localization_Palate'), request.form.get('localization_Gingiva')]
    # print(f'localization {localization}')
    # tobacco_use = [request.form.get('tobacco_use_Yes'), request.form.get('tobacco_use_Former'), request.form.get('tobacco_use_No'), request.form.get('tobacco_use_Not_informed')]
    # print(f'tobacco_use {tobacco_use}')
    # alcohol_consumption = [request.form.get('alcohol_consumption_No'), request.form.get('alcohol_consumption_Former'), request.form.get('alcohol_consumption_Yes'), request.form.get('alcohol_consumption_Not_informed')]
    # print(f'alcohol_consumption {alcohol_consumption}')
    # sun_exposure = [request.form.get('sun_exposure_No'), request.form.get('sun_exposure_Yes'), request.form.get('sun_exposure_Not_informed')]
    # print(f'sun_exposure {sun_exposure}')
    # gender = [request.form.get('gender_M'), request.form.get('gender_F')]
    # print(f'gender {gender}')
    # age_group = [request.form.get('age_group_2'), request.form.get('age_group_1'), request.form.get('age_group_0')]
    # print(f'age_group {age_group}')
    ulcers = [request.form.get('ulcers_lasts_more_than_3_weeks')]
    print(f'ulcers {ulcers}')
    ulcers_sp=[request.form.get('ulcers_spreading')]



    # Combine all input variables into a single list or array
    input_features = localization + tobacco_use + alcohol_consumption + sun_exposure + gender + age_group + ulcers+ulcers_sp
    print(f'input_features {input_features}')

    # Check for missing values or invalid data
    if None in input_features or '' in input_features:
        return jsonify({'error': 'Missing or invalid input data'})

    try:
        input_features = [float(val) for val in input_features]
    except ValueError:
        return jsonify({'error': 'Invalid input data'})

    # Make predictions using the model
    predictions = model.predict([input_features])

    # Return the predictions as JSON
    return jsonify({'predictions': predictions.tolist()})

if __name__ == '__main__':
    app.run(debug=True)