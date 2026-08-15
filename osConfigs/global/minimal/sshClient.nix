{
    programs.ssh.extraConfig = ''
        Host tmoron.fr
          HostName tmoron.fr
          RemoteForward /run/user/1000/gnupg/S.gpg-agent /run/user/1000/gnupg/S.gpg-agent
          Port 1880 
    '';
}
