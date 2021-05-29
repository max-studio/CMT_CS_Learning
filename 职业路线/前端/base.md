---
title: "前端基础"
author: "Y334275"
date: "2021-05-29"
---

# 静态页面

入门前端第一步就是多做静态页面，仿造各种网站都可以，主要是训练 CSS 和 HTML 的代码能力。经验越丰富就可以写出更加简单的 CSS 和 HTML，减少项目的维护成本。

# JavaScript

前端的第二步就是学习 JavaScript，JavaScript 基础可以看阮一峰的 [ES6 入门教程](https://es6.ruanyifeng.com/)。

# DOM

DOM 操作是学习前端的第三步，主要学习如何操作 DOM 节点，如何控制 DOM 节点的增加、删除和修改。DOM 操作的学习可以看 MDN 的 [文档对象模型 (DOM)](https://developer.mozilla.org/zh-CN/docs/Web/API/Document_Object_Model)，也可以在使用的时候去查询手册。

除了使用原生 JS 操作 DOM 节点，还有一些框架可以帮我们做到这一点，而且使用框架可以减少重复代码，这些框架在静态页面时通常十分有用。

## JQuery

JQuery 的出名程度就不用多说了，基本上是个前端都会用，虽然目前 MVVM 框架已经在逐步抢占 JQuery 的市场了，但我个人认为 JQuery 还是值得一学的，技多不压身。有关 JQuery 的入门，可以看 [菜鸟教程](https://www.runoob.com/jquery/jquery-tutorial.html)，也可以看 [W3school](https://www.w3school.com.cn/jquery/index.asp)。

## D3.js

D3 准确来说，它主要是用于制作可视化图表的框架。但是使用 D3 可以操作 DOM 节点，也可以减轻重复代码的出现。如果想要了解可视化方向，可以学习一下 D3，[D3 文档](https://github.com/d3/d3/wiki)。

# BOM

BOM 通常需要操作的对象只有 `window`，因此可以在实际使用时去 MDN 查阅对应的手册。

# TypeScript

TypeScript 是 JavaScript 的超集，在 JavaScript 的基础上增加了一个类型系统，可以帮助项目减少 bug，减少项目维护成本。在 VSCode 上，TypeScript 体验十分良好。关于 TypeScript 的入门，可以查阅 [TypeScript 文档](https://www.tslang.cn/docs/home.html)。

# Less

Less 是一门 CSS 扩展语言，给原生的 CSS 添加了变量、混合、嵌套等等内容。关于 Less 请查阅 [Less 文档](https://less.bootcss.com/#%E6%A6%82%E8%A7%88)。

> 注：使用 React 时，只有使用 UmiJS 创建的项目，才自带 Less，其他的项目均需要手动安装。

# Sass

Sass 也是一门 CSS 扩展语言，关于 Sass 请查阅 [Sass 文档](https://sass-lang.com/guide)。

> 注：Sass 使用的人数确实比 Less 多。