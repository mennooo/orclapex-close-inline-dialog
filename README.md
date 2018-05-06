# orclapex-close-inline-dialog
Oracle APEX Plugin to close an Inline Dialog

![Preview](https://github.com/mennooo/orclapex-open-inline-dialog/blob/master/preview.gif "Preview")

## Settings
Set your Inline Dialog Region as Affected Element.

## Events 

### Inline Dialog Closed
The 'Inline Dialog Closed' event is triggered on the element that opened the dialog. This is similar to the way native Dialog Page close events are handled by APEX.

This triggeringElement could be the 'Open' button for example.

If the triggeringElement is unknown, it will use the element which closed the Inline Dialog.
