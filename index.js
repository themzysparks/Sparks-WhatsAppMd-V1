const bot = require(__dirname + '/lib/amd')
const { VERSION } = require(__dirname + '/config')

// Set up Express for TCP health check
const express = require('express')
const appw = express()
const port = process.env.PORT || 3000

appw.get('/', (req, res) => {
  res.json({
    message: 'Hello, world!',
  })
})

appw.listen(port, () => {
  console.log(`App is listening on port ${port}`)
})

const start = async () => {
  console.log(`Starting Asta ${VERSION}`)
  try {
    await bot.init()
    // bot.logger.info('⏳ Database syncing!')
    await bot.DATABASE.sync()
    await bot.connect()
  } catch (error) {
    console.error(error)
    start()
  }
}

start()
