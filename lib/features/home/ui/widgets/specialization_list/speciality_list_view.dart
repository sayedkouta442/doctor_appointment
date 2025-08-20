import 'package:doctor_appointment/features/home/data/models/specialization_response_model.dart';
import 'package:doctor_appointment/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_appointment/features/home/ui/widgets/specialization_list/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatefulWidget {
  const SpecialityListView({super.key, required this.specializationData});
  final List<SpecializationData?> specializationData;

  @override
  State<SpecialityListView> createState() => _SpecialityListViewState();
}

class _SpecialityListViewState extends State<SpecialityListView> {
  var selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                specializayionId: widget.specializationData[index]?.id ?? 0,
              );
            },
            child: SpecialityListViewItem(
              itemIndex: index,
              specializationData: widget.specializationData[index],
              selectedIndex: selectedSpecializationIndex,
            ),
          );
        },
      ),
    );
  }
}
