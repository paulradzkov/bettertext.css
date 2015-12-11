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
			out:
				options:
					optimizationLevel: 3,
				files: [
					expand: true,
					cwd: 'out/images/',
					src: ['**/*.{png,jpg,gif}'],
					dest: 'out/images/'
				]
			src:
				options:
					optimizationLevel: 3,
				files: [
					expand: true,
					cwd: 'src/files/img/',
					src: ['**/*.{png,jpg,jpeg,gif}'],
					dest: 'src/files/img/'
				]
			logo:
				options:
					optimizationLevel: 3,
				files: [
					expand: true,
					cwd: 'src/documents/docs/logo/',
					src: ['**/*.{svg,png,jpg,jpeg,gif}'],
					dest: 'src/documents/docs/logo/'
				]

		# clean out dir
		clean:
			options:
				force: true
			out: ['<%= docpad.out %>']

		copy:
			main:
				files: [
					'out/vendor/normalize.css/normalize.css':'bower_components/normalize.css/normalize.css',
				]

	# Build the available Grunt tasks.
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-imagemin'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-newer'

	# Register our Grunt tasks.
	grunt.registerTask 'default',       ['copy']
