# Start with base neurodebian container
FROM library/neurodebian:nd14.04

# Update packages
RUN apt-get -y update # && apt-get -y install dcm2niix dcmtk

# TODO add XNAT image metadata... once I define what needs to be in there
#
# LABEL xnat.metadata-version="alpha.2" \
#     xnat.mounts="{\"in\": [\"/input\"], \"out\": [\"/output\"]}" \
#     xnat.usage="dcm2niix -z y -f %i_%s -o /output /input" \
#     xnat.args="{\"-z\": {\"default\": \"y\", \"description\": \"gz compress images\", \"user_settable\": true}, \"-f\": {\"default\": \"%i_%s\", \"decription\": \"file name format (%c=comments %f=folder name %i ID of patient %m=manufacturer %n=name of patient %p=protocol %s=series, %t=time)\", \"user_settable\": true}, \"-o\" {\"default\": \"/output\", \"description\": \"Output directory\", \"user_settable\": false}}"