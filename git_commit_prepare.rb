def prepare_project( _dir )
    
    if File.exist? _dir and File.directory? _dir
    
        Dir.chdir( _dir )
        
        if Dir.entries('.').size - 2 == 0
            f = File.new('.gitignore', 'w')
            f.close
            return
        end
        
        Dir.entries('.').each do |item|
            next if item.to_s == '.' || item.to_s == '..'
            prepare_project( item ) if File.directory? item
        end
    
    end
    
end

prepare_project( Dir.pwd + '/' + ARGV[0].to_s )
