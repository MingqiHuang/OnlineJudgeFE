# OnlineJudge Front End Chinese Version
[![vue](https://img.shields.io/badge/vue-2.5.13-blue.svg?style=flat-square)](https://github.com/vuejs/vue)
[![vuex](https://img.shields.io/badge/vuex-3.0.1-blue.svg?style=flat-square)](https://vuex.vuejs.org/)
[![echarts](https://img.shields.io/badge/echarts-3.8.3-blue.svg?style=flat-square)](https://github.com/ecomfe/echarts)
[![iview](https://img.shields.io/badge/iview-2.8.0-blue.svg?style=flat-square)](https://github.com/iview/iview)
[![element-ui](https://img.shields.io/badge/element-2.0.9-blue.svg?style=flat-square)](https://github.com/ElemeFE/element)
[![Build Status](https://travis-ci.org/QingdaoU/OnlineJudgeFE.svg?branch=master)](https://travis-ci.org/QingdaoU/OnlineJudgeFE)

>### A multiple pages app built for OnlineJudge. [Demo](https://qduoj.com)

## Features

+ Webpack3 multiple pages with bundle size optimization
+ Easy use simditor & Nice codemirror editor
+ Amazing charting and visualization(echarts)
+ User-friendly operation
+ Quite beautiful：)

## Get Started

Install Node.js **v6.11** first.

```bash
npm install
# we use webpack DllReference to decrease the build time,
# this command only needs execute once unless you upgrade the package in build/webpack.dll.conf.js
NODE_ENV=development npm run build:dll

# the dev-server will set proxy table to your backend
export TARGET=http://Your-backend

# serve with hot reload at localhost:8080
npm run dev
```
Then you can get a frontend preview at ``localhost:8080``, that means, nothing will be loaded except the main frame, you can only test if the website works or not, if you translated the site, you can test if there's any encoding problem.

After testing, use ``Ctrl + C`` to stop the develop server. If you would like to publish it to the production environment, please follow lines below:

```bash
npm run build
docker cp ./dist oj-backend:/app/
```

After this, your site is updated. However if you reload these pages, you may find that it keeps loading the main page, in this case, please execute commands below:

```bash
docker exec -it oj-backend /bin/sh
```

And under the prompt of docker, maybe ``/app/`` or things like that, execute command:

```bash
cd /app/deploy/
./entrypoint.sh
exit
```

You don't need to care about the result of the script, just refresh the page, and it would work.

In fact we restarted the nginix server by running script above.
## Screenshots

[Check here.](https://github.com/QingdaoU/OnlineJudge/tree/2.0)

## Browser Support

Modern browsers and Internet Explorer 10+.

## LICENSE

[MIT](http://opensource.org/licenses/MIT)
