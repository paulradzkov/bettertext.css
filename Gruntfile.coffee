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

	# Build the available Grunt tasks.
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-imagemin'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-newer'

	# Register our Grunt tasks.
	grunt.registerTask 'prod',				 ['less:development', 'less:production']
	grunt.registerTask 'dev',				 ['less:development']
	grunt.registerTask 'default',			 ['copy']
