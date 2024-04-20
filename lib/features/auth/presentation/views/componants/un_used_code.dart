// DateTime? birthDate;
// final TextEditingController dateController = TextEditingController();
// @override
// void dispose() {
//   dateController.dispose();
//   super.dispose();
// }
// Future<void> _selectDate() async {
//   final pickedDate = await DateFunction().selectBirthDate(context);
//   if (pickedDate != null) {
//     setState(() {
//       birthDate = pickedDate;
//       dateController.text = DateFormat('MM/dd/yyyy').format(pickedDate);
//     });
//     print('date selected');
//   }
// }
// const GenderSelectTextField(),
// CustomTextFormField(labelText:'Date of Birth', hintText:'mm/dd/yyyy',
// readOnly: true,
// controller: dateController,
// suffixIcon:IconButton(
// onPressed:_selectDate,
// icon:const Icon(Icons.calendar_month,color:AppColors.background,)) ,
// ),
// const CustomTextFormField(labelText:'phone number', hintText:'Enter phone number'),
// SizedBox(height:10.h,),
// SizedBox(height:10.h,),
// SizedBox(height:10.h,),