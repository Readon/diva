sources = files(['collection_tests.vala',
            'creation_strategy_tests.vala',
            'decorator_tests.vala',
            'error_tests.vala',
            'index_tests.vala',
            'lazy_tests.vala',
            'module_tests.vala',
            'property_tests.vala',
            'registration_errors.vala',
            'test_fixture.vala',
            'test_main.vala'])

tests = executable('diva_test', sources, dependencies: [diva_dep])
test('test diva function', tests)