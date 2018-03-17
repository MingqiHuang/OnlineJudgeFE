let date = require('moment')().format('YYYYMMDD')
let commit = require('child_process').execSync('git rev-parse HEAD').toString().slice(0, 5)
let version = `"${date}-${commit}"`

console.log(`当前版本是 ${version}`)

module.exports = {
  NODE_ENV: '"development"',
  VERSION: version,
  USE_SENTRY: '0'
}
