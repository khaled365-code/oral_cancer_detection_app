import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilis/image_constants.dart';
import 'package:graduation_project/features/community/presentation/screens/community_screen.dart';
import 'package:graduation_project/features/home/data/models/carousel_data_model/carousel_data_model.dart';
import 'package:graduation_project/features/home/data/models/for_you_article_data_model/for_you_article_data.dart';
import 'package:graduation_project/features/home/data/models/for_your_knowledge_model/for_your_knowledge_model.dart';
import 'package:graduation_project/features/home/presentation/views/doctor_screen.dart';
import 'package:graduation_project/features/home/presentation/views/initial_home_screen.dart';
import 'package:graduation_project/features/home/presentation/views/news_screen.dart';
import 'package:graduation_project/features/home/presentation/views/upload_Image_View.dart';
import 'package:meta/meta.dart';

part 'initial_home_screen_state.dart';

class InitialHomeScreenCubit extends Cubit<InitialHomeScreenState> {
  InitialHomeScreenCubit() : super(InitialHomeScreenInitial());


  List<CarouselDataModel>carouselDataList=
  [
    CarouselDataModel(carouselImage: ImageConstants.womanDoctorImage,
        advertisementText: 'Upload a photo\nto detect oral cancer\nor leukoplakia\nwith our AI\ntechnology',
        btnText: 'Start Now'),
    CarouselDataModel(carouselImage: ImageConstants.womanDoctorImage, advertisementText: 'Share your journey,\nask questions and\nget support from\npeople with similar\nconditions in our\ncommunity', btnText: 'Join Now'),
    CarouselDataModel(carouselImage: ImageConstants.womanDoctorImage, advertisementText: 'Discover hospitals\nacross Egypt\nspecializing in oral\ncancer Easily\naccess and contact\ntheir information', btnText: 'Find Hospitals'),
    CarouselDataModel(carouselImage: ImageConstants.womanDoctorImage, advertisementText: 'Stay updated with\ntop medical news\nSearch for the latest\ninformation\non treatments', btnText: 'Read News'),
    CarouselDataModel(carouselImage: ImageConstants.womanDoctorImage, advertisementText: 'Receive clear\nguidelines after\nyour detection\nresult and learn\nmore about the\npossible condition', btnText: 'Learn More')
  ];


  CarouselController buttonCarouselController = CarouselController();



  List<ForYourKnowledgeModel>forYourKnowledgeList=[
    ForYourKnowledgeModel(title: 'Oral Cancer', description: 'Early Signs and Symptoms of Oral Cancer'),
    ForYourKnowledgeModel(title: 'Leukoplakia vs. Oral Cancer', description: 'Understanding the differences and connections between leukoplakia and oral cancer'),
    ForYourKnowledgeModel(title: 'Leukoplakia with Dysplasia: Causes, Symptoms, and Treatment', description: 'Common risk factors including smoking, alcohol use, and HPV infection'),
    ForYourKnowledgeModel(title: 'Leukoplakia without Dysplasia: Understanding the Condition', description: 'Explain what leukoplakia without dysplasia is, its symptoms, and how it differs from leukoplakia with dysplasia'),
    ForYourKnowledgeModel(title: 'Mouth Ulcers: When to Worry', description: 'Information on common causes of mouth ulcers and when they might indicate a more serious condition.'),
    ForYourKnowledgeModel(title: 'Understanding Different Types of Oral Lesions', description: 'Explain the various types of oral lesions, their causes, and when to seek medical advice.'),
    ForYourKnowledgeModel(title: 'Maintaining Good Oral Hygiene', description: 'Tips and best practices for maintaining oral health to prevent diseases'),
    ForYourKnowledgeModel(title: 'Role of Regular Dental Checkups', description: 'Importance of regular dental visits for early detection of oral health issues.'),
    ForYourKnowledgeModel(title: 'The Impact of Smoking and Alcohol on Oral Health', description: 'Detailed information on how smoking and alcohol consumption can affect oral health and increase the risk of OSCC and leukoplakia.'),

  ];

  List<ForYouArticleDataModel>forYouArticleDataModel=[
    ForYouArticleDataModel(title: 'Early Signs and Symptoms of Oral Cancer', image: 'https://www.mayoclinic.org/-/media/kcms/gbs/patient-consumer/images/2013/08/26/10/36/ds01089_im00214_c7_mouth_cancer_picturethu_jpg.jpg', author: 'Mayo Clinic',  content: """What is Mouth Cancer?

Mouth cancer refers to cancer that develops in any of the parts that make up the mouth (oral cavity). It can occur on the:
- Lips
- Gums
- Tongue
- Inner lining of the cheeks
- Roof of the mouth
- Floor of the mouth (under the tongue)

Cancer that occurs on the inside of the mouth is sometimes called oral cancer or oral cavity cancer. Mouth cancer is one of several types of cancers grouped in a category called head and neck cancers. These cancers are often treated similarly.

Symptoms

Signs and symptoms of mouth cancer may include:
- A lip or mouth sore that doesn't heal
- A white or reddish patch on the inside of your mouth
- Loose teeth
- A growth or lump inside your mouth
- Mouth pain
- Ear pain
- Difficult or painful swallowing

Causes

Mouth cancers form when cells on the lips or in the mouth develop changes (mutations) in their DNA. The cell's DNA contains the instructions that tell a cell what to do. The mutation changes tell the cells to continue growing and dividing when healthy cells would die. The accumulating abnormal mouth cancer cells can form a tumor. Over time, they may spread inside the mouth and to other areas of the head and neck or other parts of the body. Mouth cancers most commonly begin in the flat, thin cells (squamous cells) that line your lips and the inside of your mouth. Most oral cancers are squamous cell carcinomas. It's not clear what causes the mutations in squamous cells that lead to mouth cancer, but doctors have identified factors that may increase the risk of mouth cancer.

Risk Factors

Factors that can increase your risk of mouth cancer include:
- Tobacco use of any kind, including cigarettes, cigars, pipes, chewing tobacco and snuff
- Heavy alcohol use
- Excessive sun exposure to your lips
- A sexually transmitted virus called human papillomavirus (HPV)
- A weakened immune system

Prevention

There's no proven way to prevent mouth cancer. However, you can reduce your risk of mouth cancer by:
- Stopping the use of tobacco: If you use tobacco, stop. If you don't use tobacco, don't start. Using tobacco, whether smoked or chewed, exposes the cells in your mouth to dangerous cancer-causing chemicals.
- Drinking alcohol only in moderation, if at all: Chronic excessive alcohol use can irritate the cells in your mouth, making them vulnerable to mouth cancer. If you choose to drink alcohol, do so in moderation. For healthy adults, this means up to one drink a day for women of all ages and men older than age 65, and up to two drinks a day for men age 65 and younger.
- Avoiding excessive sun exposure to your lips: Protect the skin on your lips from the sun by staying in the shade when possible. Wear a broad-brimmed hat that effectively shades your entire face, including your mouth. Apply a sunscreen lip product as part of your routine sun protection regimen.""", sources: 'Mayo Clinic'),
    ForYouArticleDataModel(title: 'Leukoplakia vs. Oral Cancer', image: 'https://tse1.explicit.bing.net/th?id=OIP.H0h1TiUt63wOia7z65fK9QHaE7&pid=Api&P=0&h=220', author: 'National Library of Medicine USA', content: """Leukoplakia and oral cancer are both conditions that affect the mouth, but they are distinct in their nature, causes, and implications. Understanding the differences and connections between leukoplakia and oral cancer is crucial for early detection, prevention, and treatment.

What is Leukoplakia?

Leukoplakia is a condition characterized by the formation of white or gray patches on the mucous membranes of the mouth. These patches can appear on the tongue, the inside of the cheeks, the gums, or the floor of the mouth. While leukoplakia itself is not cancerous, it is considered a precancerous lesion, meaning it has the potential to develop into cancer over time.

Causes of Leukoplakia:

- Tobacco Use: Smoking or chewing tobacco is a significant risk factor for leukoplakia.
- Alcohol Consumption: Heavy alcohol use can irritate the mucous membranes, contributing to the development of leukoplakia.
- Chronic Irritation: Rough teeth, ill-fitting dentures, or long-term irritation from braces or fillings can cause leukoplakia.
- Human Papillomavirus (HPV): Some strains of HPV have been linked to the development of leukoplakia.

Symptoms of Leukoplakia:

- White or gray patches in the mouth that cannot be wiped off
- Thickened or hardened areas of the mouth lining
- Irregular or smooth-textured patches
- Slightly raised lesions that may be sensitive to touch or spicy foods

What is Oral Cancer?

Oral cancer refers to cancer that develops in any part of the mouth, including the lips, tongue, cheeks, gums, floor of the mouth, hard and soft palate, and the throat. It is a type of head and neck cancer and is often aggressive, requiring prompt diagnosis and treatment.

Causes of Oral Cancer:

- Tobacco Use: Similar to leukoplakia, tobacco use is a leading cause of oral cancer.
- Heavy Alcohol Use: Alcohol can increase the risk of oral cancer, especially when combined with tobacco use.
- HPV Infection: Certain strains of HPV are strongly associated with an increased risk of oral cancer.
- Excessive Sun Exposure: Prolonged exposure to the sun can increase the risk of lip cancer.
- Poor Diet: A diet low in fruits and vegetables can increase the risk of developing oral cancer.

Symptoms of Oral Cancer:

- A sore in the mouth that doesn't heal
- Persistent mouth pain
- A lump or thickening in the cheek
- Difficulty swallowing or chewing
- Unexplained bleeding in the mouth
- Numbness or loss of feeling in any part of the mouth
- Persistent ear pain

Connections Between Leukoplakia and Oral Cancer

While leukoplakia itself is not cancerous, it can be a precursor to oral cancer. The presence of leukoplakia indicates that there are changes occurring in the mouth's epithelial cells that could potentially become cancerous. It is estimated that about 5-17% of leukoplakia cases can progress to oral cancer.

Key Points of Connection:

- Precancerous Nature: Leukoplakia is often regarded as a warning sign for oral cancer, necessitating regular monitoring and sometimes biopsy to check for dysplasia (abnormal cells that could become cancerous).
- Shared Risk Factors: Both conditions share common risk factors such as tobacco use, alcohol consumption, and HPV infection.
- Importance of Early Detection: Early detection and management of leukoplakia can prevent the progression to oral cancer. Regular dental check-ups and prompt attention to any changes in the mouth are crucial.

Prevention and Management

For Leukoplakia:

- Quit smoking and avoid all forms of tobacco.
- Limit alcohol consumption.
- Maintain good oral hygiene and visit the dentist regularly.
- Address any sources of chronic irritation in the mouth.

For Oral Cancer:

- Avoid tobacco and limit alcohol use.
- Protect lips from excessive sun exposure.
- Eat a balanced diet rich in fruits and vegetables.
- Get vaccinated against HPV.
- Conduct regular self-examinations of the mouth and report any abnormalities to a healthcare provider.

Conclusion

Leukoplakia and oral cancer are closely linked conditions that share common risk factors and require vigilant monitoring. While leukoplakia is not cancerous, its presence signals the need for caution and proactive health measures. By understanding the differences and connections between these two conditions, individuals can take steps to reduce their risk and ensure early detection and treatment if necessary. Regular dental check-ups, a healthy lifestyle, and awareness of symptoms are key components in the prevention and management of both leukoplakia and oral cancer.""", sources: 'National Library of Medicine USA'),
    ForYouArticleDataModel(title: 'Leukoplakia with Dysplasia: Causes, Symptoms, and Treatment', image: 'https://tse3.explicit.bing.net/th?id=OIP.fT2I94mjbkW0ANM5K7QxKgHaE7&pid=Api&P=0&h=220', author: 'Cleveland Clinic', content: '''
Leukoplakia with dysplasia is a condition characterized by the presence of white patches in the mouth that contain abnormal cells. Dysplasia refers to the presence of precancerous cells that have the potential to develop into oral cancer. Understanding the causes, symptoms, and treatment options for leukoplakia with dysplasia is crucial for early detection and prevention of oral cancer.

Causes of Leukoplakia with Dysplasia:

The exact cause of leukoplakia with dysplasia is not always clear, but several factors can contribute to its development:

- Tobacco Use: Smoking and chewing tobacco are significant risk factors for developing leukoplakia with dysplasia. The harmful chemicals in tobacco can cause cellular changes in the mouth lining.

- Alcohol Consumption: Heavy alcohol use can irritate the mucous membranes of the mouth, leading to the formation of leukoplakia patches.

- Chronic Irritation: Repeated trauma or irritation to the oral tissues, such as from rough teeth, ill-fitting dentures, or frequent consumption of very hot foods and drinks, can contribute to the development of leukoplakia.

- Human Papillomavirus (HPV): Certain strains of HPV have been linked to an increased risk of developing leukoplakia with dysplasia.

- Weakened Immune System: Conditions or medications that suppress the immune system can increase the risk of developing precancerous lesions in the mouth.

Symptoms of Leukoplakia with Dysplasia:

The symptoms of leukoplakia with dysplasia can vary, but common signs include:

- White or Gray Patches: The primary symptom is the presence of white or gray patches on the mucous membranes of the mouth. These patches cannot be wiped away and may have a slightly raised or rough texture.

- Thickened Areas: The affected areas may feel thickened or hardened compared to the surrounding tissues.

- Red Spots: In some cases, red patches (erythroplakia) may be present within or around the white patches, indicating a higher risk of cancerous transformation.

- Mouth Soreness: Some individuals may experience soreness or sensitivity in the affected areas, especially when consuming spicy or acidic foods.

- Changes in Texture: The texture of the patches may become rough or bumpy over time.

Diagnosis:

Diagnosing leukoplakia with dysplasia typically involves a combination of clinical examination and biopsy. During a dental or medical examination, the healthcare provider will inspect the mouth for any white or red patches. If leukoplakia is suspected, a biopsy may be performed to determine the presence and degree of dysplasia.

Treatment of Leukoplakia with Dysplasia:

The treatment for leukoplakia with dysplasia aims to remove or reduce the precancerous lesions and eliminate the risk factors contributing to their development. Treatment options include:

- Lifestyle Changes: Quitting tobacco use and reducing alcohol consumption are crucial steps in managing leukoplakia with dysplasia. These lifestyle changes can help prevent further irritation and reduce the risk of progression to oral cancer.

- Regular Monitoring: Regular follow-up visits with a dentist or oral surgeon are essential to monitor the lesions for any changes or progression. This may include periodic biopsies to assess the degree of dysplasia.

- Surgical Removal: If the dysplasia is moderate to severe, or if the lesions show signs of progression, surgical removal of the affected tissue may be recommended. This can be done through excision, laser surgery, or cryotherapy (freezing the tissue).

- Medications: In some cases, topical or systemic medications may be used to reduce the size of the lesions or prevent their recurrence. These may include retinoids, which are vitamin A derivatives that can help normalize cell growth.

- Treatment of Underlying Conditions: Addressing any underlying conditions that may be contributing to the development of leukoplakia, such as poorly fitting dental appliances or chronic irritation, is important for preventing recurrence.

Prevention:

While there is no guaranteed way to prevent leukoplakia with dysplasia, certain measures can help reduce the risk:

- Avoid Tobacco and Alcohol: Refraining from smoking and chewing tobacco, as well as limiting alcohol consumption, can significantly lower the risk of developing leukoplakia and its progression to dysplasia.

- Maintain Good Oral Hygiene: Regular brushing, flossing, and dental check-ups can help maintain oral health and identify any early signs of leukoplakia.

- Protect Your Mouth from Irritation: Avoiding chronic irritation from rough teeth, ill-fitting dentures, and excessively hot foods and drinks can reduce the risk of developing leukoplakia.

- Healthy Diet: A diet rich in fruits and vegetables can support overall health and may help protect against the development of precancerous lesions.

Conclusion:

Leukoplakia with dysplasia is a serious condition that requires prompt attention and management to prevent its progression to oral cancer. By understanding the causes, recognizing the symptoms, and seeking appropriate treatment, individuals can reduce their risk and ensure early detection and intervention. Regular dental check-ups, a healthy lifestyle, and avoiding known risk factors are key components in managing and preventing leukoplakia with dysplasia.
''', sources: 'Cleveland Clinic'),
    ForYouArticleDataModel(title: 'Leukoplakia without Dysplasia: Understanding the Condition', image: 'https://tse1.explicit.bing.net/th?id=OIP.Uxv3QmFANdLdsNRxizDeqQHaE8&pid=Api&P=0&h=220', author: 'Mayo Clinic', content: ''''
Leukoplakia with dysplasia is a condition characterized by the presence of white patches in the mouth that contain abnormal cells. Dysplasia refers to the presence of precancerous cells that have the potential to develop into oral cancer. Understanding the causes, symptoms, and treatment options for leukoplakia with dysplasia is crucial for early detection and prevention of oral cancer.

Causes of Leukoplakia with Dysplasia

The exact cause of leukoplakia with dysplasia is not always clear, but several factors can contribute to its development:

- Tobacco Use: Smoking and chewing tobacco are significant risk factors for developing leukoplakia with dysplasia. The harmful chemicals in tobacco can cause cellular changes in the mouth lining.
- Alcohol Consumption: Heavy alcohol use can irritate the mucous membranes of the mouth, leading to the formation of leukoplakia patches.
- Chronic Irritation: Repeated trauma or irritation to the oral tissues, such as from rough teeth, ill-fitting dentures, or frequent consumption of very hot foods and drinks, can contribute to the development of leukoplakia.
- Human Papillomavirus (HPV): Certain strains of HPV have been linked to an increased risk of developing leukoplakia with dysplasia.
- Weakened Immune System: Conditions or medications that suppress the immune system can increase the risk of developing precancerous lesions in the mouth.

Symptoms of Leukoplakia with Dysplasia

The symptoms of leukoplakia with dysplasia can vary, but common signs include:

- White or Gray Patches: The primary symptom is the presence of white or gray patches on the mucous membranes of the mouth. These patches cannot be wiped away and may have a slightly raised or rough texture.
- Thickened Areas: The affected areas may feel thickened or hardened compared to the surrounding tissues.
- Red Spots: In some cases, red patches (erythroplakia) may be present within or around the white patches, indicating a higher risk of cancerous transformation.
- Mouth Soreness: Some individuals may experience soreness or sensitivity in the affected areas, especially when consuming spicy or acidic foods.
- Changes in Texture: The texture of the patches may become rough or bumpy over time.

Diagnosis

Diagnosing leukoplakia with dysplasia typically involves a combination of clinical examination and biopsy. During a dental or medical examination, the healthcare provider will inspect the mouth for any white or red patches. If leukoplakia is suspected, a biopsy may be performed to determine the presence and degree of dysplasia.

Treatment of Leukoplakia with Dysplasia

The treatment for leukoplakia with dysplasia aims to remove or reduce the precancerous lesions and eliminate the risk factors contributing to their development. Treatment options include:

- Lifestyle Changes: Quitting tobacco use and reducing alcohol consumption are crucial steps in managing leukoplakia with dysplasia. These lifestyle changes can help prevent further irritation and reduce the risk of progression to oral cancer.
- Regular Monitoring: Regular follow-up visits with a dentist or oral surgeon are essential to monitor the lesions for any changes or progression. This may include periodic biopsies to assess the degree of dysplasia.
- Surgical Removal: If the dysplasia is moderate to severe, or if the lesions show signs of progression, surgical removal of the affected tissue may be recommended. This can be done through excision, laser surgery, or cryotherapy (freezing the tissue).
- Medications: In some cases, topical or systemic medications may be used to reduce the size of the lesions or prevent their recurrence. These may include retinoids, which are vitamin A derivatives that can help normalize cell growth.
- Treatment of Underlying Conditions: Addressing any underlying conditions that may be contributing to the development of leukoplakia, such as poorly fitting dental appliances or chronic irritation, is important for preventing recurrence.

Prevention

While there is no guaranteed way to prevent leukoplakia with dysplasia, certain measures can help reduce the risk:

- Avoid Tobacco and Alcohol: Refraining from smoking and chewing tobacco, as well as limiting alcohol consumption, can significantly lower the risk of developing leukoplakia and its progression to dysplasia.
- Maintain Good Oral Hygiene: Regular brushing, flossing, and dental check-ups can help maintain oral health and identify any early signs of leukoplakia.
- Protect Your Mouth from Irritation: Avoiding chronic irritation from rough teeth, ill-fitting dentures, and excessively hot foods and drinks can reduce the risk of developing leukoplakia.
- Healthy Diet: A diet rich in fruits and vegetables can support overall health and may help protect against the development of precancerous lesions.

Conclusion

Leukoplakia with dysplasia is a serious condition that requires prompt attention and management to prevent its progression to oral cancer. By understanding the causes, recognizing the symptoms, and seeking appropriate treatment, individuals can reduce their risk and ensure early detection and intervention. Regular dental check-ups, a healthy lifestyle, and avoiding known risk factors are key components in managing and preventing leukoplakia with dysplasia.
''',sources: 'Mayo Clinic',),
    ForYouArticleDataModel(
        title: "Mouth Ulcers: When to Worry",
        image: "https://assets.nhs.uk/nhsuk-cms/images/S_0118_mouth-ulcer_C0345376.width-1534.jpg",
        author: "Healthcare Specialists",
        content: """Mouth ulcers, also known as canker sores, are painful lesions that can develop inside the mouth on the cheeks, gums, tongue, lips, or throat. While most mouth ulcers are benign and heal on their own within 1-2 weeks, some may indicate underlying health issues or require medical attention.

Common causes of mouth ulcers include minor trauma (such as accidental biting), stress or anxiety, hormonal changes, and certain foods or medications. These ulcers typically present as small, round or oval sores with a white or yellow center and a red border.

In most cases, home remedies and over-the-counter treatments can help alleviate pain and promote healing. These include rinsing the mouth with saltwater, applying topical oral analgesics, and avoiding spicy or acidic foods that can irritate the ulcer.

However, certain signs may indicate a need for professional evaluation:

1. Persistent Ulcers: If an ulcer does not heal within 2 weeks or keeps recurring despite treatment, it may require further investigation.

2. Large or Unusual Ulcers: Ulcers that are unusually large, unusually shaped, or accompanied by severe pain, swelling, or fever should be evaluated by a dentist or healthcare provider.

3. Difficulty Eating or Drinking: If an ulcer makes it difficult to eat, drink, or speak comfortably, medical attention may be necessary.

4. Systemic Symptoms: Ulcers accompanied by fever, swollen lymph nodes, or persistent fatigue may indicate an underlying systemic condition that requires medical evaluation.

5. History of Oral Cancer: Individuals with a history of oral cancer or who use tobacco products should be vigilant about any changes in the mouth and seek prompt evaluation if new ulcers develop.

If you are unsure whether a mouth ulcer warrants medical attention, it is advisable to consult with a healthcare professional. Dentists are trained to evaluate oral lesions and can determine whether further investigation or treatment is necessary to rule out serious conditions.

Maintaining good oral hygiene and avoiding known triggers can help prevent recurrent mouth ulcers. Regular dental check-ups also provide an opportunity for dentists to monitor oral health and detect any changes early.""",
        sources: "American Academy of Oral Medicine, Mayo Clinic"
    ),
    ForYouArticleDataModel(
        title: "Understanding Different Types of Oral Lesions",
        image: "https://tse4.mm.bing.net/th?id=OIP.nD0ECqmSGNKHkzjBpUvSVAHaHo&pid=Api&P=0&h=220",
        author: "Healthcare Professionals",
        content: """Oral lesions encompass a wide range of abnormalities that can develop within the mouth, each with distinct causes, symptoms, and implications for oral health. One common type is leukoplakia, characterized by thick, white patches on the gums, tongue, or inside of the cheeks. These patches are often caused by chronic irritation from factors such as tobacco use or ill-fitting dentures. While most cases of leukoplakia are benign, some may indicate precancerous changes that require further evaluation.

Candidiasis, also known as oral thrush, is a fungal infection caused by Candida yeast. It appears as creamy white lesions on the tongue, inner cheeks, or roof of the mouth. Candidiasis often occurs in individuals with weakened immune systems, such as those undergoing chemotherapy or taking certain medications that suppress immune function.

Another common oral lesion is oral herpes, caused by the herpes simplex virus (HSV). Oral herpes presents as cold sores or fever blisters on the lips, gums, or roof of the mouth. These lesions are highly contagious and can recur periodically, especially during times of stress or illness.

Recognizing the symptoms of oral lesions is crucial for timely intervention and management. Persistent mouth sores, changes in tissue color or texture, pain, or difficulty chewing or swallowing should prompt a consultation with a dental or healthcare professional. Early detection and treatment can help alleviate symptoms, prevent complications, and, in some cases, identify underlying conditions that require medical attention.

Regular dental check-ups play a vital role in monitoring oral health and detecting any abnormal lesions or changes in oral tissues. Dentists are trained to identify suspicious lesions and may perform biopsies or refer patients to specialists for further evaluation and treatment as needed.

By maintaining good oral hygiene practices, seeking prompt evaluation of oral lesions, and attending regular dental check-ups, individuals can help preserve their oral health and overall well-being.""",
        sources: "National Institutes of Health, Mayo"),
    ForYouArticleDataModel(
        title: "Maintaining Good Oral Hygiene",
        image: "https://tse1.mm.bing.net/th?id=OIP.S8oiZz7zWh2Ife8SjdQuOQAAAA&pid=Api&P=0&h=220",
        author: "Hygiene Specialists",
        content: """Good oral hygiene is foundational to overall health, as it helps prevent dental problems and supports systemic well-being. Effective oral hygiene practices begin with brushing teeth at least twice daily with fluoride toothpaste. Brushing removes plaque—a sticky film of bacteria—on teeth surfaces that, if left untreated, can lead to tooth decay and gum disease.

In addition to brushing, daily flossing is crucial for cleaning between teeth and along the gumline, where toothbrush bristles cannot reach effectively. Using dental floss or interdental brushes removes food particles and plaque buildup, reducing the risk of cavities and gum inflammation.

Mouthwash can complement brushing and flossing by reducing plaque, freshening breath, and providing additional protection against oral bacteria. Choosing an ADA-approved mouthwash with antibacterial properties can help maintain oral hygiene between dental visits.

Regular dental check-ups every six months are recommended for maintaining optimal oral health. During these visits, dentists perform comprehensive examinations to detect early signs of dental issues such as cavities, gum disease, and oral cancer. Professional cleanings remove stubborn plaque and tartar buildup, which contribute to tooth decay and gum inflammation.

Individuals with specific oral health concerns or conditions—such as diabetes, smoking habits, or a history of gum disease—may benefit from more frequent dental visits. Dentists can provide tailored advice and preventive treatments, such as fluoride applications or dental sealants, to mitigate risks and preserve oral health.

By prioritizing good oral hygiene practices and regular dental check-ups, individuals can maintain healthy teeth and gums, prevent dental problems, and contribute to their overall well-being.""",
        sources: "American Dental Association, Colgate Oral Care Center"
    ),
    ForYouArticleDataModel(
        title: "Role of Regular Dental Checkups",
        image: "https://tse2.explicit.bing.net/th?id=OIP.XfETo-uiNyUiFqPOlcelgAHaEq&pid=Api&P=0&h=220s",
        author: "Dental Care Experts",
        content: """Regular dental check-ups are essential for maintaining optimal oral health throughout life. These visits not only focus on preventing dental problems but also play a crucial role in early detection and treatment of oral diseases.

During a dental check-up, the dentist examines the teeth, gums, tongue, and other oral tissues for signs of decay, gum disease, and oral cancer. They may use tools such as dental probes, mirrors, and x-rays to assess the health of teeth and underlying bone structure. Professional cleanings performed during these visits remove plaque and tartar buildup, which are major contributors to tooth decay and gum inflammation.

Dentists provide personalized oral hygiene instructions tailored to individual needs. They may recommend specific techniques for brushing and flossing, as well as the use of additional preventive treatments such as fluoride applications or dental sealants to protect teeth from decay.

For individuals with specific risk factors such as smoking, diabetes, or a history of gum disease, more frequent dental visits may be recommended. These visits allow dentists to monitor oral health closely, intervene early if problems arise, and provide timely treatments to maintain oral function and aesthetics.

In addition to regular dental visits, maintaining good oral hygiene practices at home—such as brushing teeth twice daily with fluoride toothpaste, flossing daily, and using mouthwash—is crucial for preventing dental issues and preserving overall oral health. By prioritizing regular dental check-ups and practicing good oral hygiene, individuals can minimize the need for extensive dental treatments and enjoy a healthy smile for years to come.""",
        sources: "American Dental Association, Mayo Clinic"
    ),
    ForYouArticleDataModel(
        title: "Impact of Smoking on Oral Health",
        image: "https://tse3.mm.bing.net/th?id=OIP.YDt96PNe0_LZrnIA5Fj-hAHaCm&pid=Api&P=0&h=220",
        author: "Health Experts",
        content: """Smoking poses severe risks to oral health, impacting various aspects of the mouth's anatomy and function. One of the most significant consequences is an increased susceptibility to gum disease (periodontitis). Tobacco use compromises the immune response in gum tissues, making them more prone to infection. This can lead to inflammation, gum recession, and eventual tooth loss if left untreated.

Moreover, smokers are at heightened risk of developing tooth decay. Tar and nicotine from cigarettes contribute to plaque buildup on teeth, which harbors bacteria that erode enamel and cause cavities. Additionally, smoking stains teeth and contributes to chronic bad breath.

Perhaps most alarmingly, smoking is a leading risk factor for oral cancer. Tobacco smoke contains numerous carcinogens that damage DNA in oral cells, leading to mutations that can progress into cancerous tumors in the lips, tongue, cheeks, or throat. Early signs of oral cancer include persistent mouth sores, white or red patches in the mouth, difficulty chewing or swallowing, and a lump or thickening in the oral tissues.

Quitting smoking is essential for improving oral health. Within hours of quitting, circulation improves, reducing inflammation and promoting healing in gum tissues. Over time, the risk of developing oral cancer decreases significantly. Adopting a rigorous oral hygiene routine—such as brushing teeth at least twice daily with fluoride toothpaste, flossing daily, and using mouthwash—further supports oral health recovery post-smoking. Regular dental check-ups are crucial for monitoring oral health and detecting any early signs of gum disease, tooth decay, or oral cancer.

For those struggling to quit smoking, various resources and cessation programs are available, offering support and strategies to achieve long-term tobacco-free living.""",
        sources: "Centers for Disease Control and Prevention, American Dental Association"
    ),


  ];







}
