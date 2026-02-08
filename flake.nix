{
  description = "Development templates";

  outputs = { self }: {
    templates = {

      python = {
        path = ./python;
        description = "Python environment with direnv";
      };

    };
  };
}