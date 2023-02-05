import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quill/core/model.dart';
import 'package:quill/core/providers/api_provider.dart';
import 'package:quill/widgets/touchable_opacity.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String message = '';

  @override
  Widget build(BuildContext context) {
    final quillResponse = ref.watch(
      fetchQuillMessageProvider(message: message),
    );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Enter Paragraph to Paraphrase',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 20,
                maxLength: 250,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green[300]!,
                      width: 2,
                    ),
                  ),
                ),
                onChanged: (val) {
                  setState(() => message = val);
                },
              ),
              const SizedBox(height: 30),
              if (message.isNotEmpty)
                quillResponse.when(
                  loading: () => const CupertinoActivityIndicator(),
                  error: (err, stack) => Text('error: $err'),
                  data: (quillModel) {
                    return _QuillResponseUI(quillModel);
                  },
                )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _QuillResponseUI extends StatelessWidget {
  final QuillBotModel quillModel;
  const _QuillResponseUI(this.quillModel);

  void selectText({
    required BuildContext context,
    required String str,
  }) async {
    await Clipboard.setData(ClipboardData(text: str)).then(
      (_) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Copied to your clipboard !',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < quillModel.data.first.paras3.length; i++)
          TouchableOpacity(
            onTap: () => selectText(
              context: context,
              str: quillModel.data.first.paras3[i].alt,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Answer ${i + 1}:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.grey[400]!,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    quillModel.data.first.paras3[i].alt,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
    ;
  }
}
