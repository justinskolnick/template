module.exports = function(grunt) {
  
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-copy');
  
  grunt.initConfig({
  
    pkg: grunt.file.readJSON('package.json'),
    
    dir: 'scripts',
    
    jshint: {
      all: [ 'default.js' ]
    },
    
    concat: {
      options: {
        separator: '\n\n'
      },
      dist: {
        src:  [ '<%= dir %>/default.js' ],
        dest: '<%= dir %>/default.js'
      }
    },
    
    uglify: {
      options: {
      },
      my_target: {
        files: {
          '<%= dir %>/default.min.js': '<%= dir %>/default.js',
        }
      }
    },
    
    copy: {
      dist: {
        files: [
          {
            src:  [ 'components/jquery/jquery.min.js' ],
            dest: '<%= dir %>/vendor/jquery.min.js'
          }
        ]
      }
    },
    
  });
  
//  grunt.registerTask('default', ['jshint', 'concat', 'uglify', 'copy']);
  grunt.registerTask('default', [ 'uglify' ]);
  
}