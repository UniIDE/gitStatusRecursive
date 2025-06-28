# Git Status All: Current Folder & Sib-Directories

alias gs="main"

# fn()
gitStatusThis(){
	if [ -d ".git" ]; then
		git status
	fi
	hasChanges=true
}

gitStatusSilent(){
	if [[ -d ".git" ]]; then
		out=`git status -s`
		
		string_length=${#out}
		
		if [[ $string_length -gt 0 ]];then
			hasChanges=true
			this_path=`pwd`
			dir=`basename ${this_path}`
			unsaved+=("$dir")
		fi
	fi
}

gitStatusSubDirs(){
	unsaved=()
	hasChanges=false

	# Git Status in all Sub Directories!
	for dir in */; do
		cd $dir
		gitStatusSilent
		cd - >/dev/null
	done

	# Display
	printChangedDirectories
}

printChangedDirectories(){
	RED='\033[0;31m'
	BOLD='\033[1m'
	NC='\033[0m' # No Color

	if [[ ${#unsaved[@]} -gt 0 ]];then
		echo "Has unsaved work:"	
		for d in ${unsaved[@]}; do
			echo -e "${RED}${BOLD}${d}${NC}"
		done
	else
		if [[ ! $hasChanges ]];then
			echo "No Changes! can delete"
		fi
	fi
}

main(){
	gitStatusThis
	gitStatusSubDirs
}
