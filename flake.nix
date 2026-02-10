{
  description = "Development templates";

  outputs = { self }: {
    templates = {

      python = {
        path = ./python;
        description = "Python environment with direnv";
      };

      node = {
        path = ./node;
        description = "Node environment with direnv";
      };

    };
  };
}
