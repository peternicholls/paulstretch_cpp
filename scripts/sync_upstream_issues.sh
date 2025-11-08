#!/bin/bash
# Script to create GitHub issues synced from upstream paulnasca/paulstretch_cpp repository
# Usage: ./scripts/sync_upstream_issues.sh

set -e

REPO="peternicholls/paulstretch_cpp"
TEMP_DIR=$(mktemp -d)

echo "Creating 16 upstream issues in $REPO..."

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

# Function to create issue from file
create_issue() {
    local title="$1"
    local body_file="$2"
    local issue_num="$3"
    
    gh issue create \
        --repo "$REPO" \
        --title "$title" \
        --body-file "$body_file"
    
    echo "✓ Created issue $issue_num/16: $title"
}

# Issue 1: Paulstretch segmentation fault
cat > "$TEMP_DIR/issue1.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/issues/18
**Original Author:** @dblanchemain

Hello
With LibraZiK4 I get a segmentation fault with paulStretch when I click on the rightmost square (stop), which closes paulStretch.
This did not happen in previous versions of LibraziK.
What is the problem?

strace -o strace.txt paulstretch /home/dominique/kandiskyscore/Projets/Projet2/Audios/kurt.wav

execve("/usr/bin/paulstretch", ["paulstretch", "/home/dominique/kandiskyscore/Pr"..., "2"], 0x7fff2db98830 /* 55 vars */) = 0
brk(NULL)                               = 0x556ce8932000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (Aucun fichier ou dossier de ce type)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=194575, ...}) = 0
mmap(NULL, 194575, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f56663e5000
close(3)                                = 0
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libfltk.so.1.1", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\260\375\2\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0644, st_size=706432, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f56663e3000
mmap(NULL, 727984, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5666331000
mmap(0x7f566635d000, 393216, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2c000) = 0x7f566635d000
mmap(0x7f56663bd000, 102400, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8c000) = 0x7f56663bd000
mmap(0x7f56663d6000, 32768, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xa4000) = 0x7f56663d6000
mmap(0x7f56663de000, 19376, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f56663de000
close(3)                                = 0
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libjack.so.0", O_RDONLY|O_CLOEXEC) = 3


........................................

select(4, [3], [], [], {tv_sec=0, tv_usec=98442}) = 1 (in [3], left {tv_sec=0, tv_usec=77123})
recvmsg(3, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\5\1\3\rWl\315\0\246\2\0\0\2\0\0\5\0\0\0\0\256\0r\2\253\0\377\1\20\1\1\0", iov_len=4096}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 32
recvmsg(3, {msg_namelen=0}, 0)          = -1 EAGAIN (Ressource temporairement non disponible)
futex(0x556ce867b608, FUTEX_WAKE_PRIVATE, 1) = 1
futex(0x556ce867b620, FUTEX_WAKE_PRIVATE, 1) = 1
futex(0x7f5663bb99d0, FUTEX_WAIT, 38437, NULL) = ?
+++ killed by SIGSEGV +++
EOF

create_issue "Paulstretch segmentation fault" "$TEMP_DIR/issue1.md" "1"

# Issue 2
cat > "$TEMP_DIR/issue2.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/pull/17
**Original Author:** @ttsiodras

No return in a function expecting one... Triggers undefined behavior with GCC14 (generation of an invalid instruction in my n5095).
EOF

create_issue "No return in a function expecting one... Triggers undefined behavior with GCC14" "$TEMP_DIR/issue2.md" "2"

# Issue 3
cat > "$TEMP_DIR/issue3.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/issues/16
**Original Author:** @hebronwatson

Please document a clear path to download the plug-in, somewhere in this repo, if there is one.
EOF

create_issue "Clear path to download" "$TEMP_DIR/issue3.md" "3"

# Issue 4
cat > "$TEMP_DIR/issue4.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/issues/15
**Original Author:** @amias-channer

The mac builds are not signed so require some workarounds to run.

This can be avoided by adding a signing key to the github CI

Here are the instructions, i would do it in branch an PR rather than give instructions 
but it should be done by a project admin because it needs repo secrets access and longer term key management.

https://localazy.com/blog/how-to-automatically-sign-macos-apps-using-github-actions

Happy to help if you get stuck
EOF

create_issue "Mac Builds are unsigned" "$TEMP_DIR/issue4.md" "4"

# Issue 5
cat > "$TEMP_DIR/issue5.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/issues/14
**Original Author:** @Jamaldude

Hi, is there currently any way to apply a paulstretch preference file towards multiple audio files with a batch file so I could drag and drop? That would really make my life easier than doing each one individually. I don't know if the python version would be better for this or not, but could someone send me in the right direction? Thanks!
EOF

create_issue "Multiple audio file support?" "$TEMP_DIR/issue5.md" "5"

# Issue 6
cat > "$TEMP_DIR/issue6.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/pull/12
**Original Author:** @afontenot

Just a quick fix for #11
EOF

create_issue "fix compatibility with mxml 3.0" "$TEMP_DIR/issue6.md" "6"

# Issue 7
cat > "$TEMP_DIR/issue7.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/issues/10
**Original Author:** @nebosite

It appears that binaural beats are generated through amplitude modulation, which is understandable if you want to peg the beats to a specific rate.    However it is my understanding binaural beats are also generated by pure tones that are slightly off in frequency.   I think it would be interesting to slightly shift the frequency of just the left audio track to generate a subtle beat effect.
EOF

create_issue "Feature request:  Use frequency shift to generate binaural beats" "$TEMP_DIR/issue7.md" "7"

# Issue 8
cat > "$TEMP_DIR/issue8.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/issues/9
**Original Author:** @esaruoho

D'you reckon there's any chance paulstretch could be added to homebrew? even as a cask?
EOF

create_issue "PaulStretch to Homebrew Cask?" "$TEMP_DIR/issue8.md" "8"

# Issue 9
cat > "$TEMP_DIR/issue9.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/pull/8
**Original Author:** @Chaircrusher

This simply adds the CMake build system.  This should all (still) building on Mac OS X, but I no longer have a system to test this build environment against.
EOF

create_issue "C make build system" "$TEMP_DIR/issue9.md" "9"

# Issue 10
cat > "$TEMP_DIR/issue10.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/pull/7
**Original Author:** @Chaircrusher

This patch -- which is pretty simple actually -- adds the ability to load and render to FLAC files.  It does require that libFLAC be available, and also that audiofile library 0.3.6 is available.
EOF

create_issue "ENH: Add flac reading and writing" "$TEMP_DIR/issue10.md" "10"

# Issue 11
cat > "$TEMP_DIR/issue11.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/pull/6
**Original Author:** @trebmuh

This commits adds a freedesktop file + an image to be used by it, and a manpage in English plus a French translation of it.

I have no clue how to include that in the makefile process.

Hope that helps.
EOF

create_issue "Integration improvements" "$TEMP_DIR/issue11.md" "11"

# Issue 12
cat > "$TEMP_DIR/issue12.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/pull/5
**Original Author:** @trebmuh

One small typo.
I didn't make the changes in the program's variable/function since I don't know what would be the implications (I'm not a coder).
Hope that helps.
EOF

create_issue "Update Control.cpp (typo)" "$TEMP_DIR/issue12.md" "12"

# Issue 13
cat > "$TEMP_DIR/issue13.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/issues/4
**Original Author:** @padsbanger

It is possible for anyone to compile this to Mac OS X version ?
EOF

create_issue "Mac OS X version" "$TEMP_DIR/issue13.md" "13"

# Issue 14
cat > "$TEMP_DIR/issue14.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/issues/3
**Original Author:** @smoge

I'm getting this error on an updated 64bit ArchLinux:

```
$ ./compile_linux_fftw_jack.sh 
/usr/bin/ld: /tmp/ccxnXlzq.o: undefined reference to symbol 'vorbis_block_init'
/usr/bin/ld: note: 'vorbis_block_init' is defined in DSO /usr/lib/libvorbis.so.0 so try adding it to the linker command line
/usr/lib/libvorbis.so.0: could not read symbols: Invalid operation
collect2: error: ld returned 1 exit status
```
EOF

create_issue "ArchLinux build error" "$TEMP_DIR/issue14.md" "14"

# Issue 15
cat > "$TEMP_DIR/issue15.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/issues/2
**Original Author:** @iioflow

the compile_linux_* scripts are missing the explicit link to zlib. they need "-lz" appended after "-mxml", otherwise all builds will fail with undefined references to gzopen etc.:

> > > Compiling source in /var/tmp/portage/media-sound/paulstretch-2.2/work/paulstretch-2.2-2 ...
> > > /var/tmp/portage/media-sound/paulstretch-2.2/temp/ccau9w4Y.o: In function `XMLwrapper::dosavefile(char*, int, char*)':
> > > /var/tmp/portage/media-sound/paulstretch-2.2/work/paulstretch-2.2-2/XMLwrapper.cpp:196: undefined reference to`gzopen'
> > > /var/tmp/portage/media-sound/paulstretch-2.2/work/paulstretch-2.2-2/XMLwrapper.cpp:198: undefined reference to `gzputs'
> > > /var/tmp/portage/media-sound/paulstretch-2.2/work/paulstretch-2.2-2/XMLwrapper.cpp:199: undefined reference to`gzclose'
> > > ....and so on

also happens when running the compile_* scripts directly, not just when using gentoo's source package manager. after patching compile_*.sh to include "-lz" the package builds and runs as expected.
EOF

create_issue "missing zlib linkage" "$TEMP_DIR/issue15.md" "15"

# Issue 16
cat > "$TEMP_DIR/issue16.md" << 'EOF'
[Synced from upstream]

**Original Issue:** https://github.com/paulnasca/paulstretch_cpp/issues/1
**Original Author:** @dancrew32

First off, this processor is amazing. My only issue with it so far has been the following:

1.) load up mp3
2.) set stretch to ~ 10.34x
3.) hit play (from beginning)
4.) listen to next 10 seconds of super-high frequency distortion. This sound fades out as you get to the beginning of the actual music.

I'm not sure what would cause that distortion.. perhaps an error when attempting to re-sample data at the beginning of the song? zero volume data or maybe a lack of data to read causing the processor to re-sample and amplify erroneous data? 

I could just output the stretched version of the song and chop off the distortion in the beginning, but it would be awesome (mainly for experimentation) to not get blasted by that distortion for a minute, should I turn the stretch up to ~800x.

If you have time to look into it, I'd really appreciate it! Thanks!

Edit:
I experienced this with the default settings for http://sourceforge.net/projects/hypermammut/files/paulstretch/2.2/paulstretch_win32-2.2-2.zip/download
EOF

create_issue "First few seconds at any stretch have intense distortion" "$TEMP_DIR/issue16.md" "16"

echo ""
echo "✅ All 16 issues created successfully!"
echo "View them at: https://github.com/$REPO/issues"
