import { Router } from "express";
import prisma from "./db";
import { log } from "console";

const router = Router();
router.post("/make_class", async (req, res) => {
  const newClass = await prisma.classes.create({
    data: {
      name: req.body.item["name"],
      code: req.body.item["code"],
      class: req.body.item["class"],
      description: req.body.item["description"],
      madeById: req.body.item["id"],
    },
  });
  res.json({ data: newClass });
});
router.get("/me", async (req, res) => {
  // @ts-ignore
  res.json({ message: req.user });
});
router.post("/join", async (req, res) => {
  try {
    const existingClass = await prisma.classes.findUnique({
      where: {
        code: req.body.code,
      },
      include: {
        members: true,
      },
    });

    if (!existingClass) {
      res.json({ message: "cnf" });
    } else {
      await prisma.classes.update({
        where: {
          code: req.body.code,
        },
        data: {
          members: {
            connect: {
              // @ts-ignore
              id: req.user.id,
            },
          },
        },
        include: {
          members: true,
        },
      });
      const existingClass2 = await prisma.classes.findUnique({
        where: {
          code: req.body.code,
        },
        include: {
          members: true,
        },
      });
      // @ts-ignore
      const allclasses = await prisma.user.findFirst({
        where: {
          // @ts-ignore
          id: req.user.id,
        },
        include: {
          classes: true,
        },
      });
      // @ts-ignore

      res.json(allclasses.classes);
    }
  } catch (error) {
    console.error("Error joining class:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});
router.post("/people", async (req, res) => {
  const idTis = req.body.id;
  const PeopleClass = await prisma.classes.findFirst({
    where: {
      id: idTis,
    },
    include: {
      members: true,
    },
  });
  if (PeopleClass.members.length === 0) {
    res.json({ message: "empty" });
  } else {
    res.json(PeopleClass);
  }
});
router.post("/:name", async (req, res) => {
  //id: req.params.id,
  const find = await prisma.user.update({
    where: {
      username: req.params.name,
    },
    data: {
      classes: {
        disconnect: {
          id: req.body.id,
        },
      },
    },
  });
  res.json(find);
});
router.get("/class_member", async (req, res) => {
  const allclasses = await prisma.user.findFirst({
    where: {
      // @ts-ignore
      id: req.user.id,
    },
    include: {
      classes: true,
    },
  });

  res.json(allclasses.classes);
});
router.post("/get_creator", async (req, res) => {
  const creator = await prisma.user.findFirst({
    where: {
      id: req.body.id,
    },
  });
  res.json(creator);
});

router.get("/full", async (req, res) => {
  const all_class = await prisma.classes.findMany();
  res.json(all_class);
});
router.delete("/:id", async (req, res) => {
  const deleted = await prisma.classes.delete({
    where: {
      id: req.params.id,
    },
  });
  res.json(deleted);
});

export default router;
