import 'package:firebase_wallpaper_app/modules/collections/view/widgets/collection_details.dart';
import 'package:firebase_wallpaper_app/modules/collections/view/widgets/create_collection.dart';
import 'package:firebase_wallpaper_app/modules/collections/view_model/collections_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CollectionsViewModel>().getAllCollections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Collections")),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<CollectionsViewModel>().getAllCollections();
        },
        child: Consumer<CollectionsViewModel>(
          builder: (context, collectionsViewModel, child) {
            final allCollections = collectionsViewModel.allCollections;

            if (allCollections == null || allCollections.isEmpty) {
              return const Center(child: Text("No collections available"));
            }

            return Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider.value(
                          value: collectionsViewModel,
                          child: const CreateCollection(),
                        ),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 5),
                      Text("Create a Collection"),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: allCollections.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1 / 1.4,
                    ),
                    itemBuilder: (context, index) {
                      final collection = allCollections[index];

                      return GestureDetector(
                        onTap: () {
                          context
                              .read<CollectionsViewModel>()
                              .getCollectionWallpapers(collection);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChangeNotifierProvider.value(
                                value: collectionsViewModel,
                                child:
                                    CollectionDetails(collection: collection),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                collection["name"],
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                collection["status"],
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
