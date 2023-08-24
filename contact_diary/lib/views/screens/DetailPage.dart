import 'package:contact_diary/Controllers/Contact_Controller.dart';
import 'package:contact_diary/Modal/contact_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child:
              Consumer<ContactController>(builder: (context, provider, child) {
            Contact contact = provider.getAllContactList[index];

            return Column(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.primaries[index % 18],
                  child: Text(
                    "${contact.firstName[0].toUpperCase()}${contact.lastName?[0].toUpperCase()}",
                    style: const TextStyle(
                      fontSize: 80,
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "${contact.firstName} ${contact.lastName}",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Call
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey.shade300,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.call),
                          ),
                        ),
                        const Text(
                          "Call",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    //Text
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey.shade300,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.message,
                            ),
                          ),
                        ),
                        const Text(
                          "Text",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    //Video
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey.shade300,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.video_camera_front,
                            ),
                          ),
                        ),
                        const Text(
                          "Video",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    //Email
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey.shade300,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.email,
                            ),
                          ),
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Contact Info",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.call,
                            size: 32,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${contact.contcatNo}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Mobile",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.video_camera_front_rounded),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.message),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.email,
                            size: 32,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contact.email,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const Text(
                                "Mail",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
