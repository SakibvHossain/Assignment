import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rate;
  final int count;

  const ProductCard(
      {super.key,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rate,
        required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
            child: Image.network(
              image,
              height: 200,
              width: double.infinity, // Ensures the image takes the full width
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Placeholder Title
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                // Placeholder Category
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8.0),
                // Placeholder Price
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Placeholder Description
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 12.0),
                // Rating and Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Placeholder Rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16.0,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          '$rate ($count)',
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    // Add to Cart Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('Add to Cart'),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
