# Custom TextField With Country Code

A Flutter package that provides a highly customizable TextField widget with integrated country code picker and password visibility toggle functionality.

## Features

- 📱 Built-in country code picker with flag display
- 🔒 Password field with visibility toggle
- 🎨 Highly customizable appearance
- ✨ Support for form validation
- 📝 Input formatting options
- 🌍 Customizable favorite country codes
- 🎯 Callback support for text and country code changes

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  custom_textfield_with_countrycode: ^1.0.0
```

## Usage

### Basic Phone Number Field

```dart
CustomTextFieldWithCountryCode(
  controller: TextEditingController(),
  hintText: 'Enter phone number',
  countrycode: true,
  keyboardType: TextInputType.phone,
  onCountryCodeChanged: (code) {
    print('Selected country code: $code');
  },
)
```

### Password Field

```dart
CustomTextFieldWithCountryCode(
  controller: TextEditingController(),
  hintText: 'Enter password',
  isPassword: true,
  passwordIconColor: Colors.blue,
  validator: (value) {
    if (value?.isEmpty ?? true) {
      return 'Password is required';
    }
    return null;
  },
)
```

### Regular Text Field

```dart
CustomTextFieldWithCountryCode(
  controller: TextEditingController(),
  hintText: 'Enter email',
  labelText: 'Email',
  keyboardType: TextInputType.emailAddress,
  onChanged: (value) {
    print('Email: $value');
  },
)
```

## Properties

| Property | Type | Description |
|----------|------|-------------|
| controller | TextEditingController | Controls the text being edited |
| hintText | String | Placeholder text |
| labelText | String | Label text above the field |
| isPassword | bool | Enable password mode with visibility toggle |
| countrycode | bool | Show country code picker |
| onCountryCodeChanged | Function(String)? | Callback when country code changes |
| validator | FormFieldValidator<String>? | Form validation function |
| keyboardType | TextInputType | Type of keyboard to display |

## Additional information

For issues and feature requests, please visit the [GitHub repository](https://github.com/karthikerebs/custom_textfield_with_countrycode.git).

## License

This project is licensed under the MIT License - see the LICENSE file for details.
