mocha.ui('bdd')
mocha.globals(['Ember', 'DS', 'Embertest', 'MD5'])

mocha.timeout(5)
chai.Assertion.includeStack = true
ENV = TESTING: true
