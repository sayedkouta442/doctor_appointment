import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorShimmerLoading extends StatelessWidget {
  const DoctorShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                // الصورة أو الأيقونة
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 110.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(width: 16.w),

                // النصوص (عنوان + سطرين تحته)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 18.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 14.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 14.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
