// ═══════════════════════════════════════════════════════════════════
// Section 07 — השיעור המטא-קוגניטיבי שלכם (30 min)
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import { useProgressCtx } from '@/components/ModuleShell/ModuleProgressContext';
import MethodSelector from './MethodSelector';
import PersonalPromptBuilder from './PersonalPromptBuilder';
import PersonalNotes from './PersonalNotes';
import styles from './index.module.scss';

const PersonalSection: React.FC = () => {
  const { progress, setPersonalTechnique } = useProgressCtx();
  const tech  = progress.personalTechnique;
  const topic = progress.customTopic;

  return (
    <SectionShell id="personal">
      <header className={styles.head}>
        <span className={styles.eyebrow}>החלק שלכם · 30 דקות</span>
        <h2 className={styles.title}>השיעור המטא-קוגניטיבי שלכם — לכיתה שלכם, על הנושא שבחרתם.</h2>
        <p className={styles.lede}>
          בחרו אחת מהשלוש. הפרומפט יבנה אוטומטית סביב הנושא שלכם. העתיקו, הריצו
          במודל AI שאתם משתמשים בו, ורשמו פה מה יצא ומה אתם תעשו איתו בכיתה.
        </p>
      </header>

      {!topic && (
        <p className={styles.warn}>
          חסר נושא לכיתה שלכם. חזרו לחלק 4 (הפסקה) ומלאו את הטופס.
        </p>
      )}

      <MethodSelector
        selected={tech}
        onSelect={setPersonalTechnique}
      />

      {tech && topic && (
        <>
          <PersonalPromptBuilder technique={tech} topic={topic} />
          <PersonalNotes />
        </>
      )}
    </SectionShell>
  );
};

export default PersonalSection;