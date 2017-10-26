module.exports = {
  rootUrl: 'http://html-under-test.local',
  screenshotsDir: 'visual-tests/screens/',
  system: {
    plugins: {
      'html-reporter': true
    }
  },
  browsers: {
    firefox: {
      windowSize: '800x1280',
      desiredCapabilities: {
        browserName: 'firefox'
      }
    }
  }
};
