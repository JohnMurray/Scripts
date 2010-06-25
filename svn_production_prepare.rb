def svn_production_prepare( _dir )
    
    if File.exist? _dir and File.directory? _dir
        
        Dir.chdir( _dir )

        if Dir.entries('.').each do |file_name|
            if file_name == '.svn'
                File.delete file_name
            else
                svn_production_prepare( file_name )
            end
        end

    end

end

svn_production_prepare( Dir.pwd + '/' + ARGV[0].to_s )
