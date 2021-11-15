Param(
    [Parameter(Mandatory=$True,Position=0,HelpMessage="Command you want the container to run, 'bash' for example.")]
    [String]$CONTAINER_ARG
)

# Get current location, will be mapped to /usr/src in container.
$SCRIPT_DIR = Get-Location

# Location of the user's gcloud dir
try {
    $GCLOUD_DIR = Resolve-Path '~\AppData\Roaming\gcloud' -ErrorAction STOP
}
catch {
    Write-Output 'gcloud not found under your home directory.'
    exit
}

$DOCKER_IMAGE = 'alpine/terragrunt:latest'

# Set the command for getting local images to match against:
$COMMAND_LOCAL_IMAGES = @'
& docker image ls | %{"{0}:{1}" -f ($_ -split '\s+')}
'@

$LOCAL_IMAGES = Invoke-Expression $COMMAND_LOCAL_IMAGES

if ($LOCAL_IMAGES -contains $DOCKER_IMAGE) {
    Write-Output "$DOCKER_IMAGE exists locally!"
    # Display image info and age to the user in case it's super old
    docker image ls $DOCKER_IMAGE
}else {
    docker build --pull -t $DOCKER_IMAGE .
}

docker run -it --rm -v ${SCRIPT_DIR}:/apps -v ${GCLOUD_DIR}:/root/.config/gcloud $DOCKER_IMAGE $CONTAINER_ARG
