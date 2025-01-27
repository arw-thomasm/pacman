FROM registry.access.redhat.com/ubi8/nginx-118

# Add application sources to a directory that the assemble script expects them
# and set permissions so that the container runs without root access
# With older docker that does not support --chown option for ADD statement,
# use these statements instead:
#  USER 0
#  ADD app-src /tmp/src
#  RUN chown -R 1001:0 /tmp/src
#  USER 1001
ADD --chown=1001:0 . /tmp/src

# Let the assemble script to install the dependencies
RUN /usr/libexec/s2i/assemble

# Run script uses standard ways to run the application
CMD /usr/libexec/s2i/run

