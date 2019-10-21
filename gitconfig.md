### Git configuation for ~/.gitconfig

##### Add user to git

    [user]
        email = dsguptas@gmail.com
        name = durga gupta

##### Add some alias command for git
    [alias]
        upmr = !sh -c 'git merge upstream/`git symbolic-ref --short HEAD`' -
        mr = !sh -c 'git fetch $1 merge-requests/$2/head:mr-$1-$2 && git checkout mr-$1-$2' -
        upft = !sh -c 'git fetch upstream' -
        uppl = !sh -c 'git pull upstream' -
        
##### Add password timeout time
    [credential]
        helper = cache --timeout=157680000