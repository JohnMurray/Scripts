#def: get_abs_dir
#purpose: returns an absolute directory given a relative path
#         from the process' current working directory
#note: returns directory path WITHOUT trailing slash
def get_abs_dir(dir_name)
    current = Dir.pwd()
    dir_name = dir_name.to_s.gsub(/\/$/, '')
    #check if given dir is absolute
    return dir_name if dir_name[0] == '/' || dir_name[0] == '\\' || dir_name =~ /^[A-Za-z]:\\/

    #check if the directory exists
    if File.exists?(dir_name) && File.directory?(dir_name)
        Dir.chdir(dir_name)
        abs = Dir.pwd()
        Dir.chdir(current)
        return abs 
    end
    
    #failsafe, shouldn't reach this point unless you are getting
    #a path to a file
    current.to_s + '/' + dir_name.to_s
    
end
