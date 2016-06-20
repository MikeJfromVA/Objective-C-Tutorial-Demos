# Objective-C-Tutorial-Demos

Reference code for diving into Objective-C features. Some of the examples go into implementation internals and occasionally do not strictly follow the ABI or best practices.

This repository grows organically as I add code to try out new features of Objective-C.

Any Mac with Xcode and Command-Line Tools installed should be sufficient to compile and run these codes. You can find the link for the Commnad-Line Tools by going to Xcode and selecting the Xcode -> Open Developer Tool -> More Developer Tools... menu item. Just compile everything on the command-line using ```make```. Everything should compile. Don't bother with Xcode for these.

Ready for the codes? OK, here we go! :bowtie:

**BasicsReview :**  Wow. Such code. Many basic. Wow.

**BinaryTree :** An example of how elegant tree searches can be if you don't have to check for nil.

**Blocks :** Block syntax and closures, where a closure is roughly an anonymous function reference that retains some of its surrounding state.

**ClassReview :** Very basic class, property, category, and selector demo.

**Closure :** Demo of how __block directs closures to capture local variables by reference rather than by value.

**Laugh :** Class Cluster, similar to the Abstract Factory design pattern. A factory method creates the type of instance requested by the caller. Bonus comments about virtual methods in Objective-C.

**MultImpFiles :** Creates private methods using an anonymous category.

**NewObjCFeatures :** In spite of the name, plays around with explicit autorelease pools.

**Prints :** Mixes together categories and protocols.

**Protocols :** Experiments with protocols and id.

**TestWeak :** Short proof that Objective-C garbage-collection elements zero __weak references.

**YourViewController :** Too-simple demonstration of the delegate pattern.

**arrayreflection :** Demos isKindOfClass, isMemberOfClass, and respondsToSelector.

**classmethods :** Class methods vs instance methods.

**foundation :** Some basic types and plists.

**introspectionSelector :** Using @selector as a literal dynamic function pointer.

**isEmpty :** A fun function that will tell you if a collection or pointer is *empty*.

**metaChase :** Uses probably-outdated methods to pry open object structure and peer at the implementation. Mike Ash probably responsible for this originally, and I'm just trying the same code for myself.

**method_signatures :** How does Objective-C handle multiple methods with different parameters.

**mikeash :** Guess who I copied this from?

**nil :** Objective-C allows messages to nil pointers!

**nsobject :** Just wanted to play with the copy method.
