function model = eigenfaces(X, y, num_components)
	%% Performs a PCA on X and stores num_components principal components.
	%%
	%% Args:
	%%  X [dim x num_data] Input 
	%%  y [1 x num_data] Classes
	%%	param [struct] parameter for this model
	%%		.num_components [1x1] Number of components to use.
	%%
	%% Out:
	%%  model [struct] Learned model
	%%		.name [char] Name of this model.
	%%		.W [dim x num_components] Components identified by PCA.
	%%		.num_components [1x1] Number of components used in this model.
	%%		.mu [dim x 1] Mean of 
	%%
	%% Example:
	%% 	pca(X, y, struct("num_components",100))
	%%
	if(nargin < 3)
		num_components=size(X,2)-1;
	endif
	% center data
	Pca = pca(X, num_components);
  
  % build model
  model.name = "eigenfaces";
	model.W = Pca.W;
	model.num_components = num_components;
	model.mu = Pca.mu;
	model.P = model.W'*(X - repmat(Pca.mu, 1, size(X,2)));
	model.y = y;
endfunction
