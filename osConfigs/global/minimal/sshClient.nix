{
    programs.ssh.extraConfig = ''
        Host srv
        HostName tmoron.fr
          RemoteForward /run/user/1000/gnupg/S.gpg-agent /run/user/1000/gnupg/S.gpg-agent
          Port 1880 
          
        Host tmoron-builder
          HostName tmoron.fr
          User builder
          Port 1880 
    '';
}
