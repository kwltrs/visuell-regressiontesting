gemini.suite('frontpage', (suite) => {
  suite.setUrl('/')
    .setCaptureElements('body')
    .capture('plain');
});
