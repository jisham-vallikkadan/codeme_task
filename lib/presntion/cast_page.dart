import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/movide_provider.dart';

class CastPage extends StatefulWidget {
  final int? id;
  final String? name;

  const CastPage({super.key, this.id, this.name});

  @override
  State<CastPage> createState() => _CastPageState();
}

class _CastPageState extends State<CastPage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<MovieProvider>(context, listen: false)
        .fetchcastList(context, widget.id.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Casts in ${widget.name}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<MovieProvider>(builder: (context, cast, child) {
        return  cast.isLoading? const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ): ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              cast.cast[index].person?.image?.medium ?? '',
                            ),
                            fit: BoxFit.fill)),
                    width: 100,
                    height: 150,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cast.cast[index].person?.name ?? '',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          cast.cast[index].person?.birthday ?? "",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          cast.cast[index].person?.country?.name ?? "",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: cast.cast?.length ?? 0);
      }),
    );
  }
}
