project('diva', ['vala', 'c'], version: '0.1.0')

add_project_arguments(['--vapidir', join_paths(meson.current_source_dir(), 'binding/vapi')],
                      language: 'vala')
                      
glib_dep = dependency('glib-2.0')
gobject_dep = dependency('gobject-2.0')
gee_dep = dependency('gee-0.8')

depends = [glib_dep, gobject_dep, gee_dep]

subdir('src')
subdir('test')