## Alias section 
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias upgrade='yay -Syyu && flatpak update'

alias vpnc='sudo protonvpn c'
alias vpnd='sudo protonvpn d'
alias vpns='protonvpn status'

alias pslogin='ssh -X sdaffer@psexport.slac.stanford.edu'
alias pslogin2='ssh -Y sdaffer@pslogin.slac.stanford.edu'

alias lsl='ls -lash'
# alias slaccopy='f(){scp sdaffer@psexport.slac.stanford.edu:"$1" "$2"; unset -f f;}; f'
alias slacmount='sshfs sdaffer@psexport.slac.stanford.edu:/cds/home/s/sdaffer /home/jacob/LANL/SLACServHome/'
alias slacmountd='sshfs sdaffer@psexport.slac.stanford.edu:/reg/data/ana15/xcs/xcslv3118 /home/jacob/LANL/SLACServData1/ && sshfs sdaffer@psexport.slac.stanford.edu:/reg/data/ana03/xcs/xcslv3118 /home/jacob/LANL/SLACServData2/'
alias slacmountroot='sshfs sdaffer@psexport.slac.stanford.edu:/ /home/jacob/LANL/SLACServRoot/'
# alias slaccopy2='f(){scp sdaffer@pslogin.slac.stanford.edu:"$1" "$2"; unset -f f;}; f'
alias slacmount2='sshfs sdaffer@pslogin.slac.stanford.edu:/cds/home/s/sdaffer /home/jacob/LANL/SLACServHome/'
alias slacmountd2='sshfs sdaffer@pslogin.slac.stanford.edu:/reg/data/ana15/xcs/xcslv3118 /home/jacob/LANL/SLACServData1/ && sshfs sdaffer@psexport.slac.stanford.edu:/reg/data/ana03/xcs/xcslv3118 /home/jacob/LANL/SLACServData2/'
alias slacmountroot2='sshfs sdaffer@pslogin.slac.stanford.edu:/ /home/jacob/LANL/SLACServRoot/'

alias aliasup='rm ~/.config/fish/aliases.fish && cat ~/git/distro-setup-scripts/aliases.fish >> ~/.config/fish/aliases.fish'
