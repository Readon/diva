sources = files(['auto_type_registration.vala',
        'collection_dependencies.vala',
        'container_builder.vala',
        'creation_strategy.vala',
        'creator_index.vala',
        'default_container.vala',
        'delegate_registration.vala',
        'i_registration_context.vala',
        'indexed_dependencies.vala',
        'instance_registration.vala',
        'lazy_dependencies.vala',
        'resolve_error.vala'])

incdir = [include_directories('.')]

diva_lib = static_library('diva', sources,
            dependencies : depends,
			include_directories : incdir,
            install: true,
            install_dir: [true, true, true])

diva_dep = declare_dependency(dependencies: depends, link_with: [diva_lib],
			include_directories : incdir)