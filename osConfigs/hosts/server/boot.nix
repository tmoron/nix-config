# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    boot.nix                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tomoron <tomoron@student.42angouleme.fr>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/10/27 20:31:40 by tomoron           #+#    #+#              #
#    Updated: 2026/10/27 20:31:48 by tomoron          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

{config, ... }:
{
  boot.extraModulePackages = [
    config.boot.kernelPackages.gasket #driver for google coral edge tpu
  ];

  boot.kernelParams = [
    "amdgpu.vm_update_mode=3"
	  "amdgpu.gpu_recovery=1"
  ];

  boot.extraModprobeConfig = ''
    options amdgpu virtual_display=1
    # create dummy display to be able to start x11
  ''; 
}
