import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yummyshare/models/core/recipe.dart';
import 'package:yummyshare/views/screens/recipe_detail_page.dart';
import 'package:yummyshare/views/utils/AppColor.dart';

class PopularRecipeCard extends StatelessWidget {
  final Recipe data;

  PopularRecipeCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to RecipeDetailPage when the card is tapped
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeDetailPage(data: data)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.all(15),
        // Image
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: Image.memory(
              base64.decode(data.photo),
              fit: BoxFit.cover,
            ).image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Popular Now Tag Card
            Container(
              margin: EdgeInsets.only(bottom: 8),
              width: 95,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.primary),
              child: Text(
                'Popular Now !!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ),
            // Recipe Info Wrapper
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  height: 80,
                  width: 165,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(0.26),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Recipe Title
                      Text(
                        data.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            height: 150 / 100,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'inter'),
                      ),
                      // Recipe Calories and Time
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            // Icon for servings
                            SvgPicture.asset(
                              'assets/icons/person.svg',
                              color: Colors.white,
                              width: 12,
                              height: 12,
                            ),
                            // Text for servings
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                data.servings.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            SizedBox(width: 10),
                            // Icon for time
                            Icon(Icons.alarm, size: 12, color: Colors.white),
                            // Text for time
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                data.time,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}