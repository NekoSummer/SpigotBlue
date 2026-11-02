> Source-only patch set. No full jar, no decompiled or third-party closed-source classes. Build it yourself.

SpigotBlue
======

Unofficial **source-only patch set** for Spigot/CraftBukkit 1.13.2.

This repo contains only my own source-level patches. It does **not** include a full server jar, decompiled code, or third-party closed-source classes. Build it yourself.

- Base: Spigot 1.13.2 (build/commit: ____)
- License: GPLv3 (consistent with Spigot)
- Requires: Java 8, Maven 3
- Not affiliated with Mojang or Spigot

How To
-----------

Apply Patches : `./applyPatches.sh`

### Create patch for server ###

`cd Spigot-Server`

Add your file for commit : `git add <file>`

Commit : `git commit -m <msg>`

`cd ..`

Create Patch `./rebuildPatches.sh`

### Create patch for API ###

`cd Spigot-API`

Add your file for commit : `git add <file>`

Commit : `git commit -m <msg>`

`cd ..`

Create Patch `./rebuildPatches.sh`




Compilation
-----------

We use maven to handle our dependencies.

* Install [Maven 3](http://maven.apache.org/download.html)
* Clone this repo and: `mvn clean install`
