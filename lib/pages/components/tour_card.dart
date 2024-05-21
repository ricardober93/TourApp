
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/tour_model.dart';
import 'package:myapp/pages/components/size_component.dart';
import 'package:myapp/utils/string_extension.dart';

class TourCard extends StatelessWidget {

  final Tour tour;
  const TourCard({super.key, required this.tour});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              GestureDetector(
                onTap: () {
                  if (kDebugMode) {
                    print('Tour ${tour.name}');
                  }
                },
                child: Column(
                  children: [
                    SizedContainer(
                      child: Image.network(tour.image,
                          fit: BoxFit.cover,
                          ),
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Column(
                        children: [
                          Text(
                           tour.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                           const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                tour.price.formatAsCurrency(symbol: tour.currency),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            tour.duration.formatDuration(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                          const SizedBox(height: 5),
                          Text( tour.description ,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.left,
                          ),
                         
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned.directional(
                end: 2,
                top: 5,
                textDirection: TextDirection.ltr,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0x84FFFFFF),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                      color: Colors.red,
                    ),
                    onPressed: () {
                     if (kDebugMode) {
                       print('Favorite');
                     }
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }

}
