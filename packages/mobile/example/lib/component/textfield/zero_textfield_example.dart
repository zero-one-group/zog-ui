import 'package:flutter/material.dart';
import 'package:zero_ui_mobile/zero_ui_mobile.dart';

class ZeroTextfieldExample extends StatelessWidget {
  const ZeroTextfieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zero Textfield Example'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ZeroTextField(
                  labelText: 'Label',
                  hintText: 'Input',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.underline(
                  labelText: 'Label',
                  hintText: 'Input',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.fill(
                  labelText: 'Label',
                  hintText: 'Input',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                    labelText: 'Label',
                    hintText: 'Input',
                    errorText: 'Error Text'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.fill(
                    labelText: 'Label',
                    hintText: 'Input',
                    errorText: 'Error Text'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.underline(
                    labelText: 'Label',
                    hintText: 'Input',
                    errorText: 'Error Text'),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                    labelText: 'Label', hintText: 'Input', enabled: false),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.fill(
                    labelText: 'Label', hintText: 'Input', enabled: false),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.underline(
                    labelText: 'Label', hintText: 'Input', enabled: false),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                  labelText: 'Label',
                  hintText: 'Input',
                  errorText: 'Error Text',
                  helperText: 'Support Text',
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                  labelText: 'Label',
                  hintText: 'Input',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.fill(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.underline(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                  labelText: 'Label Large',
                  hintText: 'Input Large',
                  helperText: 'Support Text Large',
                  textfielSizeType: TextfieldSize.large,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.outline(
                  labelText: 'Label Small',
                  hintText: 'Input Small',
                  helperText: 'Support Text Small',
                  textfielSizeType: TextfieldSize.small,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextField.rounded(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextFieldMultiline.outline(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  suffix: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextFieldMultiline.fill(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  suffix: const Icon(Icons.delete_forever),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ZeroTextFieldMultiline.underline(
                  labelText: 'Label',
                  hintText: 'Input',
                  helperText: 'Support Text',
                  suffix: IconButton(
                      icon: const Icon(Icons.delete_forever), onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
