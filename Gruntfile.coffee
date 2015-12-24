# Grunt Configuration
# http://gruntjs.com/getting-started#an-example-gruntfile

module.exports = (grunt) ->

	# Initiate the Grunt configuration.
	grunt.initConfig

		# Allow use of the package.json data.
		pkg: grunt.file.readJSON('package.json')

		# docpad variables
		docpad:
			files: [ './src/**/*.*' ]
			out: ['out']

		# optimize images if possible
		imagemin:
			src:
				options:
					optimizationLevel: 3,
				files: [
					expand: true,
					cwd: 'src/files/img/',
					src: ['**/*.{png,jpg,jpeg,gif}'],
					dest: 'src/files/img/'
				]

		# clean out dir
		clean:
			options:
				force: true
			out: ['<%= docpad.out %>']

		copy:
			bower:
				files: [
					'out/vendor/normalize.css/normalize.css':'bower_components/normalize.css/normalize.css',
				]

		# compile less
		less:
			development:
				options:
					sourceMap: true
				files: [
					"out/bettertext.css": "bettertext.less"
				]
			production:
				files: [
					"bettertext.css": "bettertext.less"
				]

		# track changes
		watch:
			src:
				files: ['<%= docpad.files %>']
				tasks: [
					'concurrent:target2'
				]
			out:
				files: ['<%= docpad.out %>/**/*']
				options:
					livereload: true
			less:
				files: ['bettertext.less']
				tasks: [
					'concurrent:target1'
				]

		# start server
		connect:
			server:
				options:
					port: 9778
					hostname: '*'
					base: '<%= docpad.out %>'
					livereload: true
					# open: true

		# generate development
		shell:
			docpad:
				options:
					stdout: true
				command: 'docpad generate --env static'
			docpadrun:
				options:
					stdout: true
				command: [
						'docpad run'
						'grunt devwatch'
					].join('&')

		# parallel tasks
		concurrent:
			target1: ['dev', 'notify:less']
			target2: ['shell:docpad', 'notify:shell']

		# notify
		notify:
			less:
				options:
					title: 'LESS'
					message: 'bettertext.css compiled'
			shell:
				options:
					title: 'Docpad'
					message: 'Docpad regenerated'
			server:
				options:
					title: 'Server is ready'
					message: 'http://localhost:9778'

	# measures the time each task takes
	require('time-grunt')(grunt);

	# Build the available Grunt tasks.
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-imagemin'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-shell'
	grunt.loadNpmTasks 'grunt-newer'
	grunt.loadNpmTasks 'grunt-notify'
	grunt.loadNpmTasks 'grunt-concurrent'

	# Register our Grunt tasks.
	grunt.registerTask 'prod',				 ['less:development', 'less:production']
	grunt.registerTask 'dev',				 ['less:development']
	grunt.registerTask 'devwatch',			 ['concurrent:target1', 'watch:less' ]
	grunt.registerTask 'run2',				 ['concurrent', 'connect', 'notify:server', 'watch']
	grunt.registerTask 'run',				 ['shell:docpadrun']
	grunt.registerTask 'default',			 ['run']
