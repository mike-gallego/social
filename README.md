# social

This is a demo which portrays the good use of state management, architecture and handling asynchronous functions

## Getting Started

You will need an IOS device for this since this was developed for the IOS simulator and uses googleservice-info.plist for configuration to firebase project

This app shows a list of documents fetched from Firestore. The security rules are vulnerable; I've set the read/write to true for all unauthenticated users so there is no need to sign in. After 10 documents, you can load more and 10 more will show up. Upon pressing like, it will run a transaction to update the like counter. Adding a comment will also run a transaction and add it into the list of comments for that post. All data fetched is reactable in this app, meaning you will see changes after transactions have been made.

Please contact me if you run into any issues
mgallego.business@gmail.com
