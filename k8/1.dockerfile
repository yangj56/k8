# Note
# So that’s the difference between the two. CMD and ENTRYPOINT
# In case of the CMD instruction the command line parameters passed will get replaced entirely, 
# whereas in case of entrypoint the command line parameters will get appended.

# running docker image
# docker run this-docker-image 5 (5 will be appended to this docker)
# but still we can override by --entrypoint
FROM nginx:1.19.5

EXPOSE 80
COPY index.html /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

# with cmd entry
FROM nginx

EXPOSE 80

# entry point is the default command that will be run when the 

ENTRYPOINT [ "sleep" ]

# CMD needs to be in array of arguments ["sleep","5"]
# CMD can be easily overwritten by when running docker by
# docker run this-docker-image sleep 5
CMD ["5"]
