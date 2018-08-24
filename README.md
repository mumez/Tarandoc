# Tarandoc

[Tarantool](http://tarantool.io) [document module](https://github.com/tarantool/document) wrapper based on [Tarantalk](https://github.com/mumez/Tarantalk).

It is usable as a simple/lightweight JSON document DB.

## Basic Usage

```smalltalk
"Preparing a doc"
tarantalk := TrTarantalk connect: 'taran:talk@localhost:3301'.
dogs := (tarantalk ensureSpaceNamed: 'dogs') asDocWithId.
```

```smalltalk
"Insert"
dogs insert: { 'id' -> 1. 'size'->'big'. 'name'-> 'aka'. 'ownerId' -> 1. 'age'->1 } asDictionary.
dogs insert: { 'id' -> 2. 'size'->'small'. 'name'-> 'shiro'. 'ownerId' -> 1. 'age'->2 } asDictionary.
dogs insert: { 'id' -> 3. 'size'->'midium'. 'name'-> 'ao'. 'ownerId' -> 2. 'age'->4 } asDictionary.
dogs insert: { 'id' -> 4. 'size'->'midium'. 'name'-> 'kuro'. 'ownerId' -> 2. 'age'-> 9 } asDictionary.
```

```smalltalk
"Select"
dogs selectWhere: [ :each | each id > 0 ].
"-> an Array(a Dictionary('age'->1 'id'->1 'name'->'aka' 'ownerId'->1 'size'->'big' ) a Dictionary('age'->2 'id'->2 'name'->'shiro' 'ownerId'->1 'size'->'small' ) a Dictionary('age'->4 'id'->3 'name'->'ao' 'ownerId'->2 'size'->'midium' ) a Dictionary('age'->9 'id'->4 'name'->'kuro' 'ownerId'->2 'size'->'midium' ))"

dogs selectWhere: [ :each | (each id > 0) & (each age = 1) ].
"-> an Array(a Dictionary('age'->1 'id'->1 'name'->'aka' 'ownerId'->1 'size'->'big' ))"
```

```smalltalk
"Delete"
(dogs deleteWhere: [ :each | each name = 'kuro' ]) sync. "wait delete ends (by default, async)"
(dogs countWhere: [ :each | each id > 0 ]).
"-> 3"
```

```smalltalk
"Join"
owners := (tarantalk ensureSpaceNamed: 'owners') asDocWithId.
owners insert: { 'id' -> 1. 'surname'->'suzuki'. 'name' -> 'ichiro'  } asDictionary.
owners insert: { 'id' -> 2. 'surname'->'yamada'. 'name' -> 'taro'  } asDictionary.

dogs joinTo: owners where: [:dog :owner | dog ownerId = owner id].
"-> an Array(an Array(a Dictionary('age'->1 'id'->1 'name'->'aka' 'ownerId'->1 'size'->'big' ) a Dictionary('id'->1 'name'->'ichiro' 'surname'->'suzuki' )) an Array(a Dictionary('age'->2 'id'->2 'name'->'shiro' 'ownerId'->1 'size'->'small' ) a Dictionary('id'->1 'name'->'ichiro' 'surname'->'suzuki' )) an Array(a Dictionary('age'->4 'id'->3 'name'->'ao' 'ownerId'->2 'size'->'midium' ) a Dictionary('id'->2 'name'->'taro' 'surname'->'yamada' )))"
```

```smalltalk
"Insert/Select nested documents"
talk := TrTarantalk connect: 'taran:talk@localhost:3301'.
sessions := (talk ensureSpaceNamed: 'sessions') asDocWithId.

sessions insert: {'id'->1. 'token' -> UUID new asString36. 'expires' -> 3600. 'account' -> {'id'->10. 'name'->'Suzuki'. 'address'->{'country'->'JP'} asDictionary} asDictionary} asDictionary.
sessions insert: {'id'->2. 'token' -> UUID new asString36. 'expires' -> 3600. 'account' -> {'id'->11. 'name'->'Yamada'. 'address'->{'country'->'JP'} asDictionary} asDictionary} asDictionary.
sessions insert: {'id'->3. 'token' -> UUID new asString36. 'expires' -> 3600. 'account' -> {'id'->12. 'name'->'John'. 'address'->{'country'->'US'} asDictionary} asDictionary} asDictionary.

sessions selectWhere: [ :each | each account address country = 'JP' ].
"-> an Array(a Dictionary('account'->a Dictionary('address'->a Dictionary('country'->'JP' ) 'id'->10 'name'->'Suzuki' ) 'expires'->3600 'id'->1 'token'->'1k9s43o7f6qw5wyybgizphqgg' ) a Dictionary('account'->a Dictionary('address'->a Dictionary('country'->'JP' ) 'id'->11 'name'->'Yamada' ) 'expires'->3600 'id'->2 'token'->'1k9s43kz03hu0yxt8eswqm78c' ))"

```

## Installation

```smalltalk
Metacello new
  baseline: 'Tarandoc';
  repository: 'github://mumez/Tarandoc/repository';
  load.
```

And extend your tarantool with [doc module](https://github.com/tarantool/document).

## Running

Before running tarantool, you need to require document module in your `script.lua` file.

```lua
box.cfg{listen = 3301}
doc = require('document')
fun = require('fun')
```
