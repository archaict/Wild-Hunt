{ config, pkgs, lib, ... }:

{
  home.file.".config/ranger/rc.conf".text = ''

    #set colorscheme snow
    set line_numbers false
    
    set viewmode miller
    set column_ratios 2,4
    set hidden_filter ^\.|\.(?:pyc|pyo|bak|swp)$|^lost\+found$|^__(py)?cache__$
    set show_hidden false
    set confirm_on_delete never
    set preview_script ~/.config/ranger/scope.sh
    set use_preview_script true
    set automatically_count_files true
    set open_all_images true
    set vcs_aware false
    set vcs_backend_git enabled
    set vcs_backend_hg disabled
    set vcs_backend_bzr disabled
    set preview_images true
    set preview_images_method kitty
    set unicode_ellipsis false
    set show_hidden_bookmarks true
    set preview_files true
    set preview_directories true
    set collapse_preview true
    set save_console_history true
    set status_bar_on_top false
    set draw_progress_bar_in_status_bar true
    set draw_borders true
    set dirname_in_tabs false
    set mouse_enabled true
    set display_size_in_main_column true
    set display_size_in_status_bar true
    set display_tags_in_all_columns true
    set update_title false
    set update_tmux_title false
    set shorten_title 3
    set tilde_in_titlebar false
    set max_history_size 20
    set max_console_history_size 50
    set scroll_offset 8
    set flushinput true
    set padding_right true
    set autosave_bookmarks true
    set autoupdate_cumulative_size false
    set show_cursor false
    set sort natural
    set sort_reverse false
    set sort_case_insensitive true
    set sort_directories_first true
    set sort_unicode false
    set xterm_alt_key false
    set cd_bookmarks true
    set preview_max_size 0
    set show_selection_in_titlebar true
    set idle_delay 2000
    set metadata_deep_search false
    set clear_filters_on_dir_change false
    
    
    # COMMAND ALIASES
    
    alias e    edit
    alias q    quit
    alias q!   quitall
    alias qa   quitall
    alias qall quitall
    alias setl setlocal
    
    alias filter     scout -prt
    alias find       scout -aeit
    alias mark       scout -mr
    alias unmark     scout -Mr
    alias search     scout -rs
    alias search_inc scout -rts
    alias travel     scout -aefiklst
    
    # BINDINGS
    
    # Basic
    map     Q quit!
    map     q quit
    copymap q ZZ ZQ
    
    map R     reload_cwd
    map <C-r> reset
    map <C-l> redraw_window
    map <C-c> abort
    map <esc> change_mode normal
    map ~ set viewmode!

    map i display_file
    map ? help
    map W display_log
    map w taskview_open
    map S shell $SHELL
    
    map :  console
    map ;  console
    map !  console shell%space
    map @  console -p6 shell  %%s
    map #  console shell -p%space
    map s  console shell%space
    map r  chain draw_possible_programs; console open_with%%space
    #map f  console find%space
    map f console scout -ftsea%space
    map cd console cd%space
    
    # Change the line mode
    map Mf linemode filename
    map Mi linemode fileinfo
    map Mm linemode mtime
    map Mp linemode permissions
    map Ms linemode sizemtime
    map Mt linemode metatitle
    
    # Tagging / Marking
    map t       tag_toggle
    map ut      tag_remove
    map "<any>  tag_toggle tag=%any
    map <Space> mark_files toggle=True
    map v       mark_files all=True toggle=True
    map uv      mark_files all=True val=False
    map V       toggle_visual_mode
    map uV      toggle_visual_mode reverse=True
    
    # VIM-like
    copymap <UP>       k
    copymap <DOWN>     j
    copymap <LEFT>     h
    copymap <RIGHT>    l
    copymap <HOME>     gg
    copymap <END>      G
    copymap <PAGEDOWN> <C-F>
    copymap <PAGEUP>   <C-B>
    
    map J  move down=0.5  pages=True
    map K  move up=0.5    pages=True
    copymap J <C-D>
    copymap K <C-U>
    
    # Jumping around
    map H     history_go -1
    map L     history_go 1
    map }     traverse
    
    map gh cd ~
    map ge cd /etc
    map gu cd /usr
    map gd cd /dev
    map go cd /opt
    map gv cd /var
    map gm cd /media
    map gM cd /mnt
    map gs cd /srv
    map g/ cd /
    
    # External Programs
    map E  edit
    map du shell -p du --max-depth=1 -h --apparent-size
    map dU shell -p du --max-depth=1 -h --apparent-size | sort -rh
    map yp shell -f echo -n %d/%f | xsel -i; xsel -o | xsel -i -b
    map yd shell -f echo -n %d    | xsel -i; xsel -o | xsel -i -b
    map yn shell -f echo -n %f    | xsel -i; xsel -o | xsel -i -b
    
    # Filesystem Operations
    map =  chmod
    
    #map cw console rename%space
    map cw eval fm.execute_console("bulkrename") if fm.thisdir.marked_items else fm.open_console("rename ")
    map a  rename_append
    map A  eval fm.open_console('rename ' + fm.thisfile.relative_path.replace("%", "%%"))
    map I  eval fm.open_console('rename ' + fm.thisfile.relative_path.replace("%", "%%"), position=7)
    
    map pp paste
    map po paste overwrite=True
    map pP paste append=True
    map pO paste overwrite=True append=True
    map pl paste_symlink relative=False
    map pL paste_symlink relative=True
    map phl paste_hardlink
    map pht paste_hardlinked_subtree
    map pr paste_as_root
    
    map dD console delete
    
    map dd cut
    map ud uncut
    map da cut mode=add
    map dr cut mode=remove
    map dt cut mode=toggle
    
    map yy copy
    map uy uncut
    map ya copy mode=add
    map yr copy mode=remove
    map yt copy mode=toggle
    
    # Searching
    map /  console search%space
    map n  search_next
    map N  search_next forward=False
    
    # Sorting
    map or set sort_reverse!
    map oz set sort=random
    map os chain set sort=size;      set sort_reverse=False
    map ob chain set sort=basename;  set sort_reverse=False
    map on chain set sort=natural;   set sort_reverse=False
    map om chain set sort=mtime;     set sort_reverse=False
    map oc chain set sort=ctime;     set sort_reverse=False
    map oa chain set sort=atime;     set sort_reverse=False
    map ot chain set sort=type;      set sort_reverse=False
    map oe chain set sort=extension; set sort_reverse=False
    
    map oS chain set sort=size;      set sort_reverse=True
    map oB chain set sort=basename;  set sort_reverse=True
    map oN chain set sort=natural;   set sort_reverse=True
    map oM chain set sort=mtime;     set sort_reverse=True
    map oC chain set sort=ctime;     set sort_reverse=True
    map oA chain set sort=atime;     set sort_reverse=True
    map oT chain set sort=type;      set sort_reverse=True
    map oE chain set sort=extension; set sort_reverse=True
    
    map dc get_cumulative_size
    
    # Settings
    map zc    set collapse_preview!
    map zd    set sort_directories_first!
    map zh    set show_hidden!
    map <C-h> set show_hidden!
    map zI    set flushinput!
    map zi    set preview_images!
    map zm    set mouse_enabled!
    map zp    set preview_files!
    map zP    set preview_directories!
    map zs    set sort_case_insensitive!
    map zu    set autoupdate_cumulative_size!
    map zv    set use_preview_script!
    map zf    console filter%space
    
    # Bookmarks
    map `<any>  enter_bookmark %any
    map '<any>  enter_bookmark %any
    map m<any>  set_bookmark %any
    map um<any> unset_bookmark %any
    
    map m<bg>   draw_bookmarks
    copymap m<bg>  um<bg> `<bg> '<bg>
    
    # Generate all the chmod bindings with some python help:
    eval for arg in "rwxXst": cmd("map +u{0} shell -f chmod u+{0} %s".format(arg))
    eval for arg in "rwxXst": cmd("map +g{0} shell -f chmod g+{0} %s".format(arg))
    eval for arg in "rwxXst": cmd("map +o{0} shell -f chmod o+{0} %s".format(arg))
    eval for arg in "rwxXst": cmd("map +a{0} shell -f chmod a+{0} %s".format(arg))
    eval for arg in "rwxXst": cmd("map +{0}  shell -f chmod u+{0} %s".format(arg))
    
    eval for arg in "rwxXst": cmd("map -u{0} shell -f chmod u-{0} %s".format(arg))
    eval for arg in "rwxXst": cmd("map -g{0} shell -f chmod g-{0} %s".format(arg))
    eval for arg in "rwxXst": cmd("map -o{0} shell -f chmod o-{0} %s".format(arg))
    eval for arg in "rwxXst": cmd("map -a{0} shell -f chmod a-{0} %s".format(arg))
    eval for arg in "rwxXst": cmd("map -{0}  shell -f chmod u-{0} %s".format(arg))
    
    # DEFINE KEYS FOR THE CONSOLE
    
    # Basic
    cmap <tab>   eval fm.ui.console.tab()
    cmap <s-tab> eval fm.ui.console.tab(-1)
    cmap <ESC>   eval fm.ui.console.close()
    cmap <CR>    eval fm.ui.console.execute()
    cmap <C-l>   redraw_window
    
    copycmap <ESC> <C-c>
    copycmap <CR>  <C-j>
    
    # Move around
    cmap <up>    eval fm.ui.console.history_move(-1)
    cmap <down>  eval fm.ui.console.history_move(1)
    cmap <left>  eval fm.ui.console.move(left=1)
    cmap <right> eval fm.ui.console.move(right=1)
    cmap <home>  eval fm.ui.console.move(right=0, absolute=True)
    cmap <end>   eval fm.ui.console.move(right=-1, absolute=True)
    cmap <a-left>   eval fm.ui.console.move_word(left=1)
    cmap <a-right>  eval fm.ui.console.move_word(right=1)
    
    # Line Editing
    cmap <backspace>  eval fm.ui.console.delete(-1)
    cmap <delete>     eval fm.ui.console.delete(0)
    cmap <C-w>        eval fm.ui.console.delete_word()
    cmap <A-d>        eval fm.ui.console.delete_word(backward=False)
    cmap <C-k>        eval fm.ui.console.delete_rest(1)
    cmap <C-u>        eval fm.ui.console.delete_rest(-1)
    cmap <C-y>        eval fm.ui.console.paste()
    
    # And of course the emacs way
    copycmap <up>        <C-p>
    copycmap <down>      <C-n>
    copycmap <left>      <C-b>
    copycmap <right>     <C-f>
    copycmap <home>      <C-a>
    copycmap <end>       <C-e>
    copycmap <delete>    <C-d>
    copycmap <backspace> <C-h>
    
    copycmap <backspace> <backspace2>
    cmap <allow_quantifiers> false
    
    #  PAGER KEYBINDINGS
    
    # Movement
    pmap  <down>      pager_move  down=1
    pmap  <up>        pager_move  up=1
    pmap  <left>      pager_move  left=4
    pmap  <right>     pager_move  right=4
    pmap  <home>      pager_move  to=0
    pmap  <end>       pager_move  to=-1
    pmap  <pagedown>  pager_move  down=1.0  pages=True
    pmap  <pageup>    pager_move  up=1.0    pages=True
    pmap  <C-d>       pager_move  down=0.5  pages=True
    pmap  <C-u>       pager_move  up=0.5    pages=True
    
    copypmap <UP>       k  <C-p>
    copypmap <DOWN>     j  <C-n> <CR>
    copypmap <LEFT>     h
    copypmap <RIGHT>    l
    copypmap <HOME>     g
    copypmap <END>      G
    copypmap <C-d>      d
    copypmap <C-u>      u
    copypmap <PAGEDOWN> n  f  <C-F>  <Space>
    copypmap <PAGEUP>   p  b  <C-B>
    
    # Basic
    pmap     <C-l> redraw_window
    pmap     <ESC> pager_close
    copypmap <ESC> q Q i <F3>
    pmap E      edit_file
    
    #  TASKVIEW KEYBINDINGS
    
    # Movement
    tmap <up>        taskview_move up=1
    tmap <down>      taskview_move down=1
    tmap <home>      taskview_move to=0
    tmap <end>       taskview_move to=-1
    tmap <pagedown>  taskview_move down=1.0  pages=True
    tmap <pageup>    taskview_move up=1.0    pages=True
    tmap <C-d>       taskview_move down=0.5  pages=True
    tmap <C-u>       taskview_move up=0.5    pages=True
    
    copytmap <UP>       k  <C-p>
    copytmap <DOWN>     j  <C-n> <CR>
    copytmap <HOME>     g
    copytmap <END>      G
    copytmap <C-u>      u
    copytmap <PAGEDOWN> n  f  <C-F>  <Space>
    copytmap <PAGEUP>   p  b  <C-B>
    
    # Changing priority and deleting tasks
    tmap J          eval -q fm.ui.taskview.task_move(-1)
    tmap K          eval -q fm.ui.taskview.task_move(0)
    tmap dd         eval -q fm.ui.taskview.task_remove()
    tmap <pagedown> eval -q fm.ui.taskview.task_move(-1)
    tmap <pageup>   eval -q fm.ui.taskview.task_move(0)
    tmap <delete>   eval -q fm.ui.taskview.task_remove()
    
    # Basic
    tmap <C-l> redraw_window
    tmap <ESC> taskview_close
    copytmap <ESC> q Q w <C-c>
    default_linemode devicons
    
    # find
    map <C-f> fzf_select
  '';

  home.file.".config/ranger/scope.sh".executable = true;
  home.file.".config/ranger/scope.sh".text = ''
      #!/usr/bin/env sh
      
      # Meaningful aliases for arguments:
      
      path="$1"            # Full path of the selected file
      
      width="$2"           # Width of the preview pane (number of fitting characters)
      
      height="$3"          # Height of the preview pane (number of fitting characters)
      
      cached="$4"          # Path that should be used to cache image previews
      
      preview_images="$5"  # "True" if image previews are enabled, "False" otherwise.
      
      
      
      maxln=200    # Stop after $maxln lines.  Can be used like ls | head -n $maxln
      
      
      
      # Find out something about the file:
      
      mimetype=$(file --mime-type -Lb "$path")
      
      extension=$(/bin/echo "''${path##*.}" | awk '{print tolower($0)}')
      
      
      
      # Functions:
      
      # runs a command and saves its output into $output.  Useful if you need
      
      # the return value AND want to use the output in a pipe
      
      try() { output=$(eval '"$@"'); }
      
      
      
      # writes the output of the previously used "try" command
      
      dump() { /bin/echo "$output"; }
      
      
      
      # a common post-processing function used after most commands
      
      trim() { head -n "$maxln"; }
      
      
      
      # wraps highlight to treat exit code 141 (killed by SIGPIPE) as success
      
      safepipe() { "$@"; test $? = 0 -o $? = 141; }
      
      
      
      dtfe() {
      
          if [ "$2" = "f" ]; then
      
              dump | trim | fmt -s -w $width
      
          else
      
              dump | trim
      
          fi
      
          exit "$1"
      
      }
      
      
      
      # Image previews, if enabled in ranger.
      
      if [ "$preview_images" = "True" ] && [ "$DISPLAY" ]; then
      
          case "$mimetype" in
      
              # Image previews for SVG files, disabled by default.
      
              image/svg*)
      
                  convert -size 1024x1024 "$path" png:"$cached" && exit 6 || exit 1;;
      
              # Image previews for image files. w3mimgdisplay will be called for all
      
              # image files (unless overriden as above), but might fail for
      
              # unsupported types.
      
              image/*)
      
                  exit 7;;
      
              # Image preview for video, disabled by default.:
      
              video/*)
      
                  ffmpegthumbnailer -i "$path" -o "$cached" -s 0 && exit 6 || exit 1;;
      
          esac
      
      fi
      
      
      
      case "$extension" in
      
          pdf)
      
              if [ "$preview_images" = "True" ] && [ "$DISPLAY" ]; then
      
                  try gs -q -dNOPAUSE -dBATCH -sDEVICE=jpeg -sOutputFile="$cached" -dLastPage=1 -r100 "$path" && exit 6
      
                  try evince-thumbnailer -s 1000 "$path" "$cached" && exit 6
      
              fi
      
              ;;
      
          # Archive extensions:
      
          a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|\
      
          rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
      
              try als "$path" && dtfe 0
      
              try acat "$path" && dtfe 3
      
              try bsdtar -lf "$path" && dtfe 0
      
              exit 1;;
      
          rar)
      
              # avoid password prompt by providing empty password
      
              try unrar -p- lt "$path" && dtfe 0 || exit 1;;
      
          7z)
      
              # avoid password prompt by providing empty password
      
              try 7z -p l "$path" && dtfe 0 || exit 1;;
      
          doc)
      
              try antiword "$path" && dtfe 0 f || exit 1;;
      
          docx)
      
              try pandoc -f docx -t plain "$path" -o - && dtfe 0
      
              try docx2txt "$path" - && dtfe 0
      
              exit 1;;
      
          # PDF documents:
      
          pdf)
      
              try pdftotext -l 10 -nopgbrk -q "$path" - && \
      
                  dtfe 0 f || exit 1;;
      
          # BitTorrent Files
      
          torrent)
      
              try transmission-show "$path" && dtfe 5 || exit 1;;
      
          # ODT Files
      
          odt|ods|odp|sxw)
      
              try odt2txt "$path" && dtfe 5 || exit 1;;
      
          # Jupyter notebooks
      
          ipynb)
      
              # try jupyter nbconvert --to html --stdout "$path" | w3m -T text/html -dump && dtfe 0 || exit 1;;
      
              jupyter nbconvert --to html --stdout "$path" | w3m -T text/html -dump && dtfe 4 f
      
              # echo "$path" && dtfe 4 f
      
              exit 1;;
      
          # HTML Pages:
      
          htm|html|xhtml)
      
              try w3m    -dump "$path" && dtfe 4 f
      
              try lynx   -dump "$path" && dtfe 4 f
      
              try elinks -dump "$path" && dtfe 4 f
      
              ;; # fall back to highlight/cat if the text browsers fail
      
      esac
      
      
      
      case "$extension" in
      
          ipynb)
      
              # jupyter nbconvert --to html --stdout "$path" | w3m -T text/html -dump
      
              echo narf
      
              ;;
      
      esac
      
      
      
      case "$mimetype" in
      
          # Syntax highlight for text files:
      
          text/* | */xml)
      
              if [ "$(tput colors)" -ge 256 ]; then
      
                  pygmentize_format=terminal256
      
                  highlight_format=xterm256
      
              else
      
                  pygmentize_format=terminal
      
                  highlight_format=ansi
      
              fi
      
              try safepipe highlight --out-format=''${highlight_format} "$path" && dtfe 5
      
              try safepipe pygmentize -f ''${pygmentize_format} "$path" && dtfe 5
      
              exit 2;;
      
          # Ascii-previews of images:
      
          image/*)
      
              img2txt --gamma=0.6 --width="$width" "$path" && exit 4 || exit 1;;
      
          # Display information about media files:
      
          video/* | audio/*)
      
              exiftool "$path" && exit 5
      
              # Use sed to remove spaces so the output fits into the narrow window
      
              try mediainfo "$path" && { dump | trim | sed 's/  \+:/: /;';  exit 5; } || exit 1;;
      
      esac
      
      
      
      exit 1
      
      
      '';
}