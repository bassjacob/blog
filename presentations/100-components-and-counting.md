---
title: 100 components and counting
subtitle: lessons from a year of building interfaces in react
theme: solarized
---

# how has your year been? {data-background="#073642" .center}

## build scripts

<p style="font-size: 75px;">makefiles -> grunt -> gulp -> npm scripts</p>

## bundlers

<p style="font-size: 75px;">browserify -> webpack -> webpack 2.0</p>

## transpilers

<p style="font-size: 75px;">6to5 -> babel 5 -> babel 6</p>

## there have been lots of changes {.center}

<p style="font-size: 75px;">the changes will continue until morale improves</p>

# &nbsp; {data-background="http://static.bassjacob.com/presentations/100-components-and-counting/fixing.gif"}

## overhaul a company's frontend {data-background="#073642" .center}

---

<img src="http://static.bassjacob.com/presentations/100-components-and-counting/thinking1.png" width="55%"/>

---

<img src="http://static.bassjacob.com/presentations/100-components-and-counting/thinking2.png" width="55%"/>

---

<img src="http://static.bassjacob.com/presentations/100-components-and-counting/page-without.png" width="60%"/>

---

<img src="http://static.bassjacob.com/presentations/100-components-and-counting/page-with.png" width="60%"/>

---

## share and share alike

- ### header
- ### footer
- ### hero
- ### map

# ![](http://static.bassjacob.com/presentations/100-components-and-counting/rube.gif)

## favour simple interactions over complex shared state {data-background="#073642" .center}

## reactjs architecture and the mTTR

<p style="font-size: 75px;">[m]ean [t]ime [t]o [r]edux</p>

## flux, redux, mobx, rxjs

> - <p style="font-size: 75px;">don't use setState, use flux</p>
> - <p style="font-size: 75px;">don't use flux, use redux</p>
> - <p style="font-size: 75px;">don't use redux, use mobx</p>
> - <p style="font-size: 75px;">don't use mobx, use rxjs</p>

## presentational components

## the wait of the web

<p style="font-size: 75px;">it's not a typo, it's a pun</p>

---

![](http://static.bassjacob.com/presentations/100-components-and-counting/nojs.png)

---

![](http://static.bassjacob.com/presentations/100-components-and-counting/nojs2.png)

# &nbsp; {data-background="http://static.bassjacob.com/presentations/100-components-and-counting/overhaul.gif"}

## everything is a module. everything is a repo? {data-background="#073642" .center}

## Mono Repo

![](http://static.bassjacob.com/presentations/100-components-and-counting/cfuipackages.png)

## Mono Repo

- ## shared behaviour
- ## tightly coupled dependencies
- ## system complexity > historical simplicity

## Many Repo

![](http://static.bassjacob.com/presentations/100-components-and-counting/githubsearch.png)

## Many Repo

- ## separate concerns
- ## unintrusive updates
- ## you don't employ the creators of lerna.js

## either way many modules

## can create, update and ship individual components

### your teams can interop without treading on each others toes

# &nbsp; {data-background="http://static.bassjacob.com/presentations/100-components-and-counting/bobthebuilder.jpg"}

## design your build system {data-background="#073642" .center}

<h2>be like bob</h2>

## make it easy to do it right

![](http://static.bassjacob.com/presentations/100-components-and-counting/boilerplate.png)

---

<img src="http://static.bassjacob.com/presentations/100-components-and-counting/boilerplate-output.png" width="50%"/>

---

<img src="http://static.bassjacob.com/presentations/100-components-and-counting/component1.png" width="80%"/>

---

<img src="http://static.bassjacob.com/presentations/100-components-and-counting/component2.png" width="100%"/>


## easy to enforce with a build system

---

![](http://static.bassjacob.com/presentations/100-components-and-counting/fe-build-output.png)

## use community tools

- ## browserify/webpack
- ## babel
- ## express

## create-react-app

![](http://static.bassjacob.com/presentations/100-components-and-counting/create-react-app.png)

# create a rendering framework {data-background="#073642" .center}

## make it easy to use

## make it simple to extend

## tailor it to your needs

## be ready to throw it all away

# recap {data-background="#073642" .center}

## react

- #### [R]eplace incrementally
- #### [E]xperiment, analyse and don't be afraid to re-engineer
- #### [A]ssess your choices, don't choose tech for tech's sake
- #### [C]omponents and modular architecture
- #### [T]ool-Up
