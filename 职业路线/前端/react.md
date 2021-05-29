---
title: "React 生态"
author: "Y334275"
date: "2021-05-29"
---

# 学习 React

对于 React 的初学者，可以看 [React 官方文档](https://zh-hans.reactjs.org/docs/getting-started.html)。

# 在项目中使用 React

在真实的项目中，要使用 React 通常有几种启动方式。

## 使用 create-react-app

第一种是使用 React 官方提供的 create-react-app 来创建 React 项目，这样创建出来的项目只有 React 基本只有 React，不包含 Router、状态管理等等，需要自己手动安装，但是这样创建的项目体积小巧，可扩展性高。更多信息请查阅 [create-react-app 官方文档](https://github.com/facebook/create-react-app)

## 使用 UmiJS（推荐）

蚂蚁集团针对于 React 制作了一个开源的脚手架，叫做 UmiJS，使用 UmiJS 会自动将 Router、状态管理等等内容加入到项目中，无需复杂的配置，上手简单。更多信息请查阅 [UmiJS 官方文档](https://umijs.org/zh-CN/docs)

## 使用 Gatsby

Gatsby 是一个用于搭建静态展示类网站的脚手架，拥有丰富的插件，支持 Markdown 语法解析及展示，可以快速搭建展示类项目，通常这种项目都是不需要后台的。更多信息请查阅 [Gatsby 官方文档](https://www.gatsbyjs.com/docs)。

# 组件库

对于 React 基础组件，推荐使用 Ant Design，更多信息请查阅 [Ant Design 官方文档](https://ant.design/docs/react/introduce-cn)。

此外，还有一套高级组件（注意：非 React 高阶组件），可以帮助快速搭建站点，叫做 ProComponents，更多信息请查阅 [ProComponents 官方文档](https://procomponents.ant.design/docs/intro)。

# 快速搭建中后台

对于中后台项目，可以使用 Ant Design Pro 脚手架，可以快速搭建中后台项目，不足的地方在于，代码逻辑比较复杂，很多东西用不着，关于这个脚手架的更多信息，请查阅 [Ant Design Pro 官方文档](https://pro.ant.design/docs/getting-started-cn)。

# 状态管理

状态管理一般有三个选择。

## unstated-next

特点是小巧、速度快，更多请看 [unstated-next 文档](https://github.com/jamiebuilds/unstated-next/blob/master/README-zh-cn.md)。

## Redux

我没用过原生的，感兴趣请自行查看 [Redux 文档](https://redux.js.org/introduction/getting-started)。

## DvaJS

一个基于 Redux 的封装，优点在于 UmiJS 自带这个框架，上手简单，更多请查阅 [@umijs/plugin-dva 文档](https://umijs.org/zh-CN/plugins/plugin-dva)。

