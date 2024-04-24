import 'package:flutter/material.dart';
import 'package:tryproject/Pages/UserSignInPage.dart';
import 'package:tryproject/Pages/DriverSignInPage.dart';
import 'package:tryproject/Pages/HospitalSignInPage.dart';

class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  State<UserType> createState() => _SimpleDropDownState();
}

class _SimpleDropDownState extends State<UserType> {
  String _selectedItem = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Selected Type : $_selectedItem",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 20),
                AutocompleteTextField(
                  items: SelectType,
                  decoration: const InputDecoration(
                      labelText: 'Select Type of account',
                      border: OutlineInputBorder()),
                  validator: (val) {
                    if (SelectType.contains(val)) {
                      return null;
                    } else {
                      return 'Invalid';
                    }
                  },
                  onItemSelect: (selected) {
                    setState(() {
                      _selectedItem = selected;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      String message = 'Form invalid';
                      if (_formKey.currentState?.validate() ?? false) {
                        message = 'Form valid';
                      }
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(message)));
                    },
                    child: const Text("Continue"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AutocompleteTextField extends StatefulWidget {
  final List<String> items;
  final Function(String) onItemSelect;
  final InputDecoration? decoration;
  final String? Function(String?)? validator;
  const AutocompleteTextField(
      {Key? key,
      required this.items,
      required this.onItemSelect,
      this.decoration,
      this.validator})
      : super(key: key);

  @override
  State<AutocompleteTextField> createState() => _AutocompleteTextFieldState();
}

class _AutocompleteTextFieldState extends State<AutocompleteTextField> {
  final FocusNode _focusNode = FocusNode();
  late OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  late List<String> _filteredItems;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context)?.insert(_overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        onChanged: _onFieldChange,
        decoration: widget.decoration,
        validator: widget.validator,
      ),
    );
  }

  void _onFieldChange(String val) {
    setState(() {
      if (val == '') {
        _filteredItems = widget.items;
      } else {
        _filteredItems = widget.items
            .where(
                (element) => element.toLowerCase().contains(val.toLowerCase()))
            .toList();
      }
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, size.height + 5.0),
                child: Material(
                  elevation: 4.0,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView.builder(
                      itemCount: _filteredItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = _filteredItems[index];
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            _controller.text = item;
                            _focusNode.unfocus();
                            widget.onItemSelect(item);
                            switch (item) {
          case "User":
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserSignInPage()));
            break;
          case "Hospital":
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => HospitalSignInPage()));
            break;
          case "Driver":
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => DriverSignInPage()));
            break;
          default:
            break;
        }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ));
  }
}

/// list of countries
final List<String> SelectType = [
  "User",
  "Hospital",
  "Driver"
];
