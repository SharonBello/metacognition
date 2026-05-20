// ═══════════════════════════════════════════════════════════════════
// PersonalPromptBuilder — composes a 4-part prompt for the teacher's
// own class using the selected method's template, substituting their
// subject/grade/topic/context.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import PromptCard from '@/components/PromptCard/PromptCard';
import { DEMO_BY_ID } from '@/data/methods';
import type { TechniqueKey, CustomTopic } from '@/types/module.types';
import styles from './PersonalPromptBuilder.module.scss';

interface Props {
  technique: TechniqueKey;
  topic:     CustomTopic;
}

function buildPrompt(tech: TechniqueKey, t: CustomTopic) {
  const demo = DEMO_BY_ID[tech];
  const ctx = t.context ? ` ${t.context}` : '';

  if (tech === 'kwl') {
    return {
      ...demo.prompt,
      contextHe: `אני מתחיל/ה יחידה בנושא "${t.topic}" ב${t.subject}, כיתה ${t.grade}. שיעור פתיחה — 45 דקות.${ctx}`,
      taskHe: `בני/ה לי טופס KWL מותאם — שלוש עמודות. ב-K: 5 שאלות שמוציאות ידע מוקדם. ב-W: 5 שאלות מעוררות סקרנות. ב-L: 3 שאלות סיכום ליחידה. הוסיפ/י 5 תפיסות שגויות נפוצות שצפויות לעלות ב-K — כדי שאדע מראש מה לחפש.`,
    };
  }

  if (tech === 'thinkaloud') {
    return {
      ...demo.prompt,
      contextHe: `אני מלמד/ת ${t.subject} בכיתה ${t.grade}. סוג הבעיות שבו תלמידים נתקעים בנושא "${t.topic}": [תיאור].${ctx} דוגמה ספציפית של בעיה כזאת: [פרטו].`,
    };
  }

  // exit
  return {
    ...demo.prompt,
    contextHe: `סיימתי שיעור על "${t.topic}" ב${t.subject}, כיתה ${t.grade}.${ctx} רוצה כרטיס יציאה של 2-3 דקות, אבל לא אחד — מבחר.`,
  };
}

const PersonalPromptBuilder: React.FC<Props> = ({ technique, topic }) => {
  const demo   = DEMO_BY_ID[technique];
  const prompt = buildPrompt(technique, topic);

  return (
    <section className={styles.section}>
      <span className={styles.eyebrow}>שלב 2 · הפרומפט שלכם</span>
      <h3 className={styles.title}>
        {demo.nameHe} · עבור <em>"{topic.topic}"</em>, כיתה {topic.grade}
      </h3>
      <p className={styles.note}>
        השלימו את החלקים בסוגריים מרובעים, העתיקו, והריצו ב-AI. אם הוספתם פרטים
        על תלמיד ספציפי, התייעצו עם רכז/ת מקצוע לפני הריצה.
      </p>
      <PromptCard prompt={prompt} />
    </section>
  );
};

export default PersonalPromptBuilder;